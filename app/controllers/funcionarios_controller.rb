# encoding: utf-8

class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  
  def index
    @funcionarios = current_colegio.funcionarios
    authorize @funcionarios
    
    respond_with(@funcionarios)
  end

  def show
    authorize @funcionario
    respond_with @funcionario
  end

  def new
    @funcionario = Funcionario.new
    authorize @funcionario
    
    @cargos = CargoFuncionario.where(["id not in (?)", current_colegio.diretor.id || '0'])
    respond_with(@funcionario)
  end

  def edit
    authorize @funcionario
    
    @colegios = [current_colegio]
    @cargos = CargoFuncionario.all
  end

  def create
    @funcionario = current_colegio.funcionarios.create(funcionario_params)
    authorize @funcionario
    
    @funcionario.save
    respond_with @funcionario
  end

  def update
    authorize @funcionario
    
    @funcionario.update(funcionario_params)
    respond_with(@funcionario)
  end

  def destroy
    authorize @funcionario
    
    @funcionario.destroy
    respond_with(@funcionario)
  end

  private
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    def funcionario_params
      params.require(:funcionario).permit(:nome, :cpf, :email, :colegio_id, :cargo_funcionario_id)
    end
end
