# encoding: utf-8

class MembroConselhoFiscaisController < ApplicationController
  before_action :set_membro_conselho_fiscal, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  def index
    @membro_conselho_fiscais = MembroConselhoFiscal.all
    respond_with(@membro_conselho_fiscais)
  end

  def show
    respond_with(@membro_conselho_fiscal)
  end

  def new
    @membro_conselho_fiscal = MembroConselhoFiscal.new
    respond_with(@membro_conselho_fiscal)
  end

  def edit
  end

  def create
    @membro_conselho_fiscal = MembroConselhoFiscal.new(membro_conselho_fiscal_params)
    @membro_conselho_fiscal.save
    respond_with @membro_conselho_fiscal.conselho_fiscal
  end

  def update
    @membro_conselho_fiscal.update(membro_conselho_fiscal_params)
    respond_with(@membro_conselho_fiscal)
  end

  def destroy
    @membro_conselho_fiscal.destroy
    respond_with(@membro_conselho_fiscal)
  end
  
  
  private
    def set_membro_conselho_fiscal
      @membro_conselho_fiscal = MembroConselhoFiscal.find(params[:id])
    end

    def membro_conselho_fiscal_params
      params.require(:membro_conselho_fiscal).permit(:cargo_membro_conselho_fiscal_id, :aluno_id, :conselho_fiscal_id, :suplente, :efetivo)
    end
end
