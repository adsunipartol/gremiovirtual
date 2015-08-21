# encoding: utf-8

class EleicaoGremiosController < ApplicationController
  before_action :set_eleicao_gremio, only: [:show, :edit, :update, :destroy, :votacao]
  respond_to :html, :xml, :json
  
  def index
    if current_colegio.gremio.eleicao_gremio.nil?
      redirect_to new_eleicao_gremio_path
    else
      redirect_to(@eleicao_gremio = current_colegio.gremio.eleicao_gremio)
    end
  end

  def show
    respond_with(@eleicao_gremio)
  end

  def new
    @eleicao_gremio = EleicaoGremio.new
    authorize @eleicao_gremio
    respond_with(@eleicao_gremio)
  end

  def edit
  end

  def create
    @eleicao_gremio = EleicaoGremio.new(eleicao_gremio_params)
    authorize @eleicao_gremio
    
    @eleicao_gremio.save
    respond_with(@eleicao_gremio)
  end

  def update
    @eleicao_gremio.update(eleicao_gremio_params)
    respond_with(@eleicao_gremio)
  end

  def destroy
    @eleicao_gremio.destroy
    respond_with(@eleicao_gremio)
  end
  
  def votacao
    
  end

  private
    def set_eleicao_gremio
      @eleicao_gremio = EleicaoGremio.find(params[:id])
    end

    def eleicao_gremio_params
      params.require(:eleicao_gremio).permit(:gremio_id, :data_inicio_inscricoes, :data_termino_inscricoes, :data_votacao, :comissao_eleitoral_id, chapa_candidatas_attributes: [:chapa_id])
    end
end
