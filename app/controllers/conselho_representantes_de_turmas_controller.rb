# encoding: utf-8

class ConselhoRepresentantesDeTurmasController < ApplicationController
  before_action :set_conselho_representantes_de_turma, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json


  def index
    @conselho_representantes_de_turmas = current_colegio.conselho_representantes_de_turma
    respond_with(@conselho_representantes_de_turmas)
  end

  def show
    respond_with(@conselho_representantes_de_turma)
  end

  def new
    @conselho_representantes_de_turma = ConselhoRepresentantesDeTurma.new
    respond_with(@conselho_representantes_de_turma)
  end

  def edit
  end

  def create
    @conselho_representantes_de_turma = ConselhoRepresentantesDeTurma.new(conselho_representantes_de_turma_params)
    @conselho_representantes_de_turma.save
    respond_with(@conselho_representantes_de_turma)
  end

  def update
    @conselho_representantes_de_turma.update(conselho_representantes_de_turma_params)
    respond_with(@conselho_representantes_de_turma)
  end

  def destroy
    @conselho_representantes_de_turma.destroy
    respond_with(@conselho_representantes_de_turma)
  end

  private
    def set_conselho_representantes_de_turma
      @conselho_representantes_de_turma = ConselhoRepresentantesDeTurma.find(params[:id])
    end

    def conselho_representantes_de_turma_params
      params.require(:conselho_representantes_de_turma).permit(:gremio_id)
    end
end
