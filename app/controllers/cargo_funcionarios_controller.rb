# encoding: utf-8

class CargoFuncionariosController < ApplicationController
  before_action :set_cargo_funcionario, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  def index
    @cargo_funcionarios = CargoFuncionario.all
    respond_with(@cargo_funcionarios)
  end

  def show
    respond_with(@cargo_funcionario)
  end

  def new
    @cargo_funcionario = CargoFuncionario.new
    respond_with(@cargo_funcionario)
  end

  def edit
  end

  def create
    @cargo_funcionario = CargoFuncionario.new(cargo_funcionario_params)
    @cargo_funcionario.save
    respond_with(@cargo_funcionario)
  end

  def update
    @cargo_funcionario.update(cargo_funcionario_params)
    respond_with(@cargo_funcionario)
  end

  def destroy
    @cargo_funcionario.destroy
    respond_with(@cargo_funcionario)
  end

  private
    def set_cargo_funcionario
      @cargo_funcionario = CargoFuncionario.find(params[:id])
    end

    def cargo_funcionario_params
      params.require(:cargo_funcionario).permit(:descricao)
    end
end
