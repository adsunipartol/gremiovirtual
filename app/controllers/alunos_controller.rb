# encoding: utf-8

class AlunosController < ApplicationController
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  
  # GET /alunos
  # GET /alunos.json
  def index
    @alunos = current_colegio.alunos
  end

  # GET /alunos/1
  # GET /alunos/1.json
  def show
    authorize @aluno
  end

  # GET /alunos/new
  def new
    @aluno = current_colegio.alunos.new
    authorize @aluno
    
    if params[:turma_id].present?
      @turmas = [Turma.find(params[:turma_id])]
    else
      @turmas = current_colegio.turmas
    end
    
    respond_with @aluno
  end

  # GET /alunos/1/edit
  def edit
    authorize @aluno
    
    @turmas = current_colegio.turmas
    respond_with @aluno
  end

  # POST /alunos
  # POST /alunos.json
  def create
    @aluno = current_colegio.alunos.create(aluno_params)
    authorize @aluno
    
    if @aluno.save
      create_usuario_if_not_exists
      flash[:info] = 'Aluno cadastrado com sucesso!'
      
      redirect_to @aluno.turma
    else
      flash[:warning] = 'Não foi possível salvar o aluno...'
      redirect_to @aluno.turma
    end
  end

  # PATCH/PUT /alunos/1
  # PATCH/PUT /alunos/1.json
  def update
    authorize @aluno
    
    @aluno.update(aluno_params)
    flash[:info] = 'Dados atualizados!'
    
    redirect_to @aluno
  end

  # DELETE /alunos/1
  # DELETE /alunos/1.json
  def destroy
    authorize @aluno
    @aluno.destroy
    redirect_to @aluno.turma
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno
      @aluno = Aluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aluno_params
      params.require(:aluno).permit(:matricula, :nome, :cpf, :email, :dtnascimento, :cidade_id, :turma_id, :ativo, :colegio_id)
    end
    
    def create_usuario_if_not_exists
      if not Usuario.exists?(:email => @aluno.email)
        u = Usuario.create(nome: @aluno.nome, email: @aluno.email, password: @aluno.matricula, password_confirmation: @aluno.matricula)
        u.save
        UsuarioMailer.bem_vindo(u).deliver
      end
    end
end
