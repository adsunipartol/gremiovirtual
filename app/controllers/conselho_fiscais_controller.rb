# encoding: utf-8

class ConselhoFiscaisController < ApplicationController
  before_action :set_conselho_fiscal, only: [:show, :destroy, :finalizar_cadastro, :adicionar_membro_efetivo, :adicionar_membro_suplente]
  before_action :set_membro_efetivo, only: :adicionar_membro_efetivo
  before_action :set_membro_suplente, only: :adicionar_membro_suplente
  
  respond_to :html, :xml, :json
  
  
  def index
    if current_colegio.gremio
      redirect_to current_colegio.gremio.conselho_fiscal || new_conselho_fiscal_path
    else
      redirect_to new_gremio_path
    end
  end
  
  def show
    authorize @conselho_fiscal
    
    @alunos_efetivo = current_colegio.alunos
    @alunos_suplente = current_colegio.alunos
    
    respond_with @conselho_fiscal
  end
  
  def new
    @conselho_fiscal = ConselhoFiscal.new
    authorize @conselho_fiscal
    respond_with @conselho_fiscal
  end
  
  def create
    @conselho_fiscal = ConselhoFiscal.new(conselho_fiscal_params)
    @conselho_fiscal.ano_vigencia = Time.now.year
    @conselho_fiscal.gremio = current_colegio.gremio
    authorize @conselho_fiscal
    
    if @conselho_fiscal.save
      current_colegio.gremio.reload
      flash[:info] = "Conselho Fiscal salvo com sucesso"
    else
      flash[:warning] = "Não foi possível salvar os dados do Conselho Fiscal"
    end
    
    respond_with @conselho_fiscal
  end
  
  def finalizar_cadastro
    @conselho_fiscal.finalizado = true
    
    if @conselho_fiscal.save
      flash[:info] = "Conselho Fiscal finalizado"
    else
      flash[:warning] = "Não foi possível salvar o Conselho Fiscal"
    end
    
    redirect_to @conselho_fiscal
  end
  
  def adicionar_membro_efetivo
    @conselho_fiscal.membros << @membro_efetivo
    
    if @conselho_fiscal.save
      flash[:info] = "Membro Efetivo adicionado com sucesso"
    else
      flash[:warning] = "Não foi possível adicionar este membro"
    end
    
    redirect_to @conselho_fiscal
  end
  
  def adicionar_membro_suplente
    @conselho_fiscal.membros << @membro_suplente
    
    if @conselho_fiscal.save
      flash[:info] = "Membro Suplente adicionado com sucesso"
    else
      flash[:warning] = "Não foi possível adicionar este membro"
    end
    
    redirect_to @conselho_fiscal
  end
  
  
  def destroy
    authorize @conselho_fiscal
    @conselho_fiscal.destroy
    respond_with @conselho_fiscal
  end
  
  private
    def set_conselho_fiscal
      @conselho_fiscal = ConselhoFiscal.find(params[:id])
    end
    
    def conselho_fiscal_params
      params.require(:conselho_fiscal).permit(:gremio_id)
    end
    
    def membro_params
      params.permit(:aluno_id, :cargo_membro_conselho_fiscal_id)
    end
    
    def set_membro_efetivo
      @membro_efetivo = MembroConselhoFiscal.new(membro_params)
      @membro_efetivo.efetivo = true
    end
    
    def set_membro_suplente
      @membro_suplente = MembroConselhoFiscal.new(membro_params)
      @membro_suplente.suplente = true
    end
end
