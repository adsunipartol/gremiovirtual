# encoding: utf-8

class CargoMembroConselhoFiscaisController < ApplicationController
  before_action :set_cargo_membro_conselho_fiscal, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  def index
    @cargo_membro_conselho_fiscais = CargoMembroConselhoFiscal.all
    respond_with(@cargo_membro_conselho_fiscais)
  end

  def show
    respond_with(@cargo_membro_conselho_fiscal)
  end

  def new
    @cargo_membro_conselho_fiscal = CargoMembroConselhoFiscal.new
    respond_with(@cargo_membro_conselho_fiscal)
  end

  def edit
  end

  def create
    @cargo_membro_conselho_fiscal = CargoMembroConselhoFiscal.new(cargo_membro_conselho_fiscal_params)
    @cargo_membro_conselho_fiscal.save
    respond_with(@cargo_membro_conselho_fiscal)
  end

  def update
    @cargo_membro_conselho_fiscal.update(cargo_membro_conselho_fiscal_params)
    respond_with(@cargo_membro_conselho_fiscal)
  end

  def destroy
    @cargo_membro_conselho_fiscal.destroy
    respond_with(@cargo_membro_conselho_fiscal)
  end

  private
    def set_cargo_membro_conselho_fiscal
      @cargo_membro_conselho_fiscal = CargoMembroConselhoFiscal.find(params[:id])
    end

    def cargo_membro_conselho_fiscal_params
      params.require(:cargo_membro_conselho_fiscal).permit(:descricao)
    end
end
