# encoding: utf-8

class ComissaoEleitoraisController < ApplicationController
  before_action :set_comissao_eleitoral, only: [:show, :edit, :update, :destroy, :adicionar_membro, :finalizar_cadastro]
  respond_to :html, :xml, :json
  
  def index
    if current_colegio.gremio && current_colegio.gremio.comissao_eleitoral
      @comissao_eleitoral = current_colegio.gremio.comissao_eleitoral
      redirect_to @comissao_eleitoral
    else
      redirect_to new_comissao_eleitoral_path
    end
  end

  def show
    authorize @comissao_eleitoral
    
    @alunos = current_colegio.alunos_ativos.where("id not in(#{MembroComissaoEleitoral.all.map{ |m| m.aluno.id}.join(',')})")
    
    respond_with @comissao_eleitoral
  end

  def new
    @comissao_eleitoral = ComissaoEleitoral.new
    authorize @comissao_eleitoral
    
    respond_with(@comissao_eleitoral)
  end

  def edit
    authorize @comissao_eleitoral
  end

  def create
    @comissao_eleitoral = ComissaoEleitoral.new(comissao_eleitoral_params)
    @comissao_eleitoral.gremio = current_colegio.gremio
    authorize @comissao_eleitoral
    
    @comissao_eleitoral.save
    respond_with(@comissao_eleitoral)
  end

  def update
    authorize @comissao_eleitoral
    
    @comissao_eleitoral.update(comissao_eleitoral_params)
    respond_with(@comissao_eleitoral)
  end

  def destroy
    authorize @comissao_eleitoral
    
    @comissao_eleitoral.destroy
    respond_with(@comissao_eleitoral)
  end
    
  def adicionar_membro
    @comissao_eleitoral.membros.find_or_create_by(:aluno_id => params[:aluno_id])
    
    if @comissao_eleitoral.save
      flash[:info] = "Membro adicionado com sucesso"
    else
      flash[:warning] = "Não foi possível adicionar o membro"
    end
    
    redirect_to @comissao_eleitoral
  end
  
  def finalizar_cadastro
    @comissao_eleitoral.finalizada = true
    
    if @comissao_eleitoral.save
      flash[:info] = "Comissão Eleitoral salva com sucesso"
    else
      flash[:warning] = "Não foi possível salvar a Comissão Eleitoral"
    end
    
    redirect_to @comissao_eleitoral
  end
  

  private
    def set_comissao_eleitoral
      @comissao_eleitoral = ComissaoEleitoral.find(params[:id])
    end

    def comissao_eleitoral_params
      params.require(:comissao_eleitoral).permit(:gremio_id)
    end
end
