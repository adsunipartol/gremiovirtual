# encoding: utf-8

class RepresentanteDeTurmasController < ApplicationController
  before_action :set_representante_de_turma, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  def index
    @representantes_de_turmas = current_colegio.conselho_representantes_de_turma.representantes
  end

  def show
    authorize @representante_de_turma
    respond_with @representante_de_turma
  end

  def new
    turma = Turma.find(params[:turma_id])
    
    @representante_de_turma = turma.representantes.new
    authorize @representante_de_turma
    
    # Retornamos os Alunos da Turma
    @alunos = turma.alunos.where(["id not in (?)", current_colegio.representantes_de_turma.map{ |r| r.id }.join(',')])
    
    @cargos = CargoRepresentanteDeTurma.where(["id not in (?)", current_colegio.representantes_de_turma.map{ |r| r.id }.join(',')])
    
    respond_with(@representante_de_turma)
  end

  def edit
    authorize @representante_de_turma
    
    @cargos = CargoRepresentanteDeTurma.all
    @alunos = @representante_de_turma.turma.alunos
  end

  def create
    @representante_de_turma = current_colegio.conselho_representantes_de_turma.representantes.build(representante_de_turma_params)
    authorize @representante_de_turma
    
    if @representante_de_turma.save
      flash[:info] = 'Representante de turma salvo!'
      redirect_to @representante_de_turma.turma
    else
      flash[:warning] = 'Não foi possível salvar o Representante de Turma'
      #redirect_to new_turma_representante_path(@representante_de_turma.turma)
      render :new
    end
  end

  def update
    authorize @representante_de_turma
    
    if @representante_de_turma.update(representante_de_turma_params)
      flash[:info] = "Representante de Turma atualizado"
      respond_with(@representante_de_turma.turma)
    else
      flash[:warning] = "Não foi possível atualizar o Representante de Turma"
      redirect_to @representante_de_turma.turma
    end
  end

  def destroy
    authorize @representante_de_turma
    @representante_de_turma.destroy
    
    redirect_to @representante_de_turma.turma
  end
  
  private
    def set_representante_de_turma
      @representante_de_turma = RepresentanteDeTurma.find(params[:id])
    end

    def representante_de_turma_params
      params.require(:representante_de_turma).permit(:turma_id, :aluno_id, :cargo_representante_de_turma_id)
    end
end
