# encoding: utf-8

class MembroComissaoEleitoraisController < ApplicationController
  before_action :set_membro_comissao_eleitoral, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  def index
    @membro_comissao_eleitorais = MembroComissaoEleitoral.all
    respond_with(@membro_comissao_eleitorais)
  end

  def show
    respond_with(@membro_comissao_eleitoral)
  end

  def new
    @membro_comissao_eleitoral = MembroComissaoEleitoral.new
    respond_with(@membro_comissao_eleitoral)
  end

  def edit
  end

  def create
    @membro_comissao_eleitoral = MembroComissaoEleitoral.new(membro_comissao_eleitoral_params)
    @membro_comissao_eleitoral.save
    respond_with(@membro_comissao_eleitoral)
  end

  def update
    @membro_comissao_eleitoral.update(membro_comissao_eleitoral_params)
    respond_with(@membro_comissao_eleitoral)
  end

  def destroy
    @membro_comissao_eleitoral.destroy
    respond_with(@membro_comissao_eleitoral.comissao_eleitoral)
  end

  private
    def set_membro_comissao_eleitoral
      @membro_comissao_eleitoral = MembroComissaoEleitoral.find(params[:id])
    end

    def membro_comissao_eleitoral_params
      params.require(:membro_comissao_eleitoral).permit(:comissao_eleitoral_id, :aluno_id)
    end
end
