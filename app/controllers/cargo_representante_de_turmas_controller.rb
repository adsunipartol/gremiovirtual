# encoding: utf-8

class CargoRepresentanteDeTurmasController < ApplicationController
  before_action :set_cargo_representante_de_turma, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  def index
    @cargo_representante_de_turmas = CargoRepresentanteDeTurma.all
    respond_with(@cargo_representante_de_turmas)
  end

  def show
    respond_with(@cargo_representante_de_turma)
  end

  def new
    @cargo_representante_de_turma = CargoRepresentanteDeTurma.new
    respond_with(@cargo_representante_de_turma)
  end

  def edit
  end

  def create
    @cargo_representante_de_turma = CargoRepresentanteDeTurma.new(cargo_representante_de_turma_params)
    @cargo_representante_de_turma.save
    respond_with(@cargo_representante_de_turma)
  end

  def update
    @cargo_representante_de_turma.update(cargo_representante_de_turma_params)
    respond_with(@cargo_representante_de_turma)
  end

  def destroy
    @cargo_representante_de_turma.destroy
    respond_with(@cargo_representante_de_turma)
  end

  private
    def set_cargo_representante_de_turma
      @cargo_representante_de_turma = CargoRepresentanteDeTurma.find(params[:id])
    end

    def cargo_representante_de_turma_params
      params.require(:cargo_representante_de_turma).permit(:descricao)
    end
end
