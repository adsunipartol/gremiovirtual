# encoding: utf-8

class CargoMembroChapasController < ApplicationController
  before_action :set_cargo_membro_chapa, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  def index
    @cargo_membro_chapas = CargoMembroChapa.all
    respond_with(@cargo_membro_chapas)
  end

  def show
    respond_with(@cargo_membro_chapa)
  end

  def new
    @cargo_membro_chapa = CargoMembroChapa.new
    respond_with(@cargo_membro_chapa)
  end

  def edit
  end

  def create
    @cargo_membro_chapa = CargoMembroChapa.new(cargo_membro_chapa_params)
    @cargo_membro_chapa.save
    respond_with(@cargo_membro_chapa)
  end

  def update
    @cargo_membro_chapa.update(cargo_membro_chapa_params)
    respond_with(@cargo_membro_chapa)
  end

  def destroy
    @cargo_membro_chapa.destroy
    respond_with(@cargo_membro_chapa)
  end

  private
    def set_cargo_membro_chapa
      @cargo_membro_chapa = CargoMembroChapa.find(params[:id])
    end

    def cargo_membro_chapa_params
      params.require(:cargo_membro_chapa).permit(:descricao)
    end
end
