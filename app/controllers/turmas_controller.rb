# encoding: utf-8

class TurmasController < ApplicationController
  before_action :set_turma, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  # GET /turmas
  # GET /turmas.json
  def index
    @turmas = current_colegio.turmas
  end

  # GET /turmas/1
  # GET /turmas/1.json
  def show
    authorize @turma
  end

  # GET /turmas/new
  def new
    @turma = current_colegio.turmas.new
    authorize @turma
    
    respond_with(@turma)
  end

  # GET /turmas/1/edit
  def edit
    authorize @turma
  end

  # POST /turmas
  # POST /turmas.json
  def create
    @turma = current_colegio.turmas.create(turma_params)
    authorize @turma
    
    @turma.ano_vigencia = Time.now.year
    @turma.save
    respond_with(@turma)
  end

  # PATCH/PUT /turmas/1
  # PATCH/PUT /turmas/1.json
  def update
    authorize @turma
    @turma.update(turma_params)
    respond_with(@turma)
  end

  # DELETE /turmas/1
  # DELETE /turmas/1.json
  def destroy
    authorize @turma
    @turma.destroy
    redirect_to colegio_turmas_path(current_colegio)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turma
      @turma = Turma.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def turma_params
      params.require(:turma).permit(:serie, :turno, :ensino, :colegio_id)
    end
end
