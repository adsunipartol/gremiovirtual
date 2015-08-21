# encoding: utf-8

class CargoMembroComissaoEleitoraisController < ApplicationController
  before_action :set_cargo_membro_comissao_eleitoral, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  def index
    @cargo_membro_comissao_eleitorais = CargoMembroComissaoEleitoral.all
    respond_with(@cargo_membro_comissao_eleitorais)
  end

  def show
    respond_with(@cargo_membro_comissao_eleitoral)
  end

  def new
    @cargo_membro_comissao_eleitoral = CargoMembroComissaoEleitoral.new
    respond_with(@cargo_membro_comissao_eleitoral)
  end

  def edit
  end

  def create
    @cargo_membro_comissao_eleitoral = CargoMembroComissaoEleitoral.new(cargo_membro_comissao_eleitoral_params)
    @cargo_membro_comissao_eleitoral.save
    respond_with(@cargo_membro_comissao_eleitoral)
  end

  def update
    @cargo_membro_comissao_eleitoral.update(cargo_membro_comissao_eleitoral_params)
    respond_with(@cargo_membro_comissao_eleitoral)
  end

  def destroy
    @cargo_membro_comissao_eleitoral.destroy
    respond_with(@cargo_membro_comissao_eleitoral)
  end

  private
    def set_cargo_membro_comissao_eleitoral
      @cargo_membro_comissao_eleitoral = CargoMembroComissaoEleitoral.find(params[:id])
    end

    def cargo_membro_comissao_eleitoral_params
      params.require(:cargo_membro_comissao_eleitoral).permit(:descricao)
    end
end
