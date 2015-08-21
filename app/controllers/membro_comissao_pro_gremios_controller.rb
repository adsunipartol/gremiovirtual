# encoding: utf-8

class MembroComissaoProGremiosController < ApplicationController
  before_action :set_membro_comissao_pro_gremio, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  def index
    @membro_comissao_pro_gremio = MembroComissaoProGremio.all
    authorize @membro_comissao_pro_gremio
    respond_with(@membro_comissao_pro_gremio)
  end

  def show
    authorize @membro_comissao_pro_gremio
    respond_with(@membro_comissao_pro_gremio)
  end

  def new
    @membro_comissao_pro_gremio = MembroComissaoProGremio.new
    authorize @membro_comissao_pro_gremio
    
    @alunos = current_colegio.alunos_ativos
    respond_with(@membro_comissao_pro_gremio)
  end

  def edit
    authorize @membro_comissao_pro_gremio
  end

  def create
    @membro_comissao_pro_gremio = MembroComissaoProGremio.new(membro_comissao_pro_gremio_params)
    authorize @membro_comissao_pro_gremio
    
    if current_colegio.comissao_pro_gremio.nil?
      comissao = ComissaoProGremio.new(colegio_id: current_colegio.id)
      comissao.save
      
      @membro_comissao_pro_gremio.comissao_pro_gremio = comissao
      
      current_colegio.comissao_pro_gremio = comissao
      current_colegio.save
    end
    
    @membro_comissao_pro_gremio.save
    
    @alunos = current_colegio.alunos_ativos
    respond_with(@membro_comissao_pro_gremio)
  end

  def update
    authorize @membro_comissao_pro_gremio
    @membro_comissao_pro_gremio.update(membro_comissao_pro_gremio_params)
    respond_with(@membro_comissao_pro_gremio)
  end

  def destroy
    authorize @membro_comissao_pro_gremio
    @membro_comissao_pro_gremio.destroy
    
    respond_with @membro_comissao_pro_gremio.comissao_pro_gremio
  end

  private
    def set_membro_comissao_pro_gremio
      @membro_comissao_pro_gremio = MembroComissaoProGremio.find(params[:id])
    end

    def membro_comissao_pro_gremio_params
      params.require(:membro_comissao_pro_gremio).permit(:aluno_id, :comissao_pro_gremio_id)
    end
end
