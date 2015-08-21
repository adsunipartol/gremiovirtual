# encoding: utf-8

class MembroChapasController < ApplicationController
  before_action :set_membro_chapa, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  def index
    @membro_chapas = MembroChapa.all
    respond_with(@membro_chapas)
  end

  def show
    authorize @membro_chapa
    
    respond_with(@membro_chapa)
  end

  def new
    @membro_chapa = MembroChapa.new
    #authorize @membro_chapa
    
    respond_with(@membro_chapa)
  end

  def edit
    #authorize @membro_chapa
  end

  def create
    @membro_chapa = MembroChapa.new(membro_chapa_params)
    #authorize @membro_chapa
    
    if @membro_chapa.save
      flash[:info] = "Membro salvo com sucesso"
    else
      flash[:warning] = "Não foi possível salvar o Membro"
    end
    
    redirect_to edit_chapa_path(@membro_chapa.chapa)
  end

  def update
    @membro_chapa.update(membro_chapa_params)
    #authorize @membro_chapa
    
    respond_with(@membro_chapa)
  end

  def destroy
    #authorize @membro_chapa
    
    if @membro_chapa.destroy
      flash[:info] = "Membro removido"
    else
      flash[:warning] = "Não foi possível remover o membro"
    end
    redirect_to edit_chapa_path(@membro_chapa.chapa)
  end

  private
    def set_membro_chapa
      @membro_chapa = MembroChapa.find(params[:id])
    end

    def membro_chapa_params
      params.require(:membro_chapa).permit(:chapa_id, :aluno_id, :cargo_membro_chapa_id)
    end
end
