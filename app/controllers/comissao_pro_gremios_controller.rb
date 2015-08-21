# encoding: utf-8

class ComissaoProGremiosController < ApplicationController
  before_action :set_comissao_pro_gremio, only: [:show, :edit, :update, :destroy, :adicionar_membro, :finalizar_cadastro]
  before_action :set_alunos_disponiveis, only: [:show]
  respond_to :html, :xml, :json
  
  
  def index
    redirect_to current_colegio.comissao_pro_gremio || new_comissao_pro_gremio_path
  end


  def show
    @alunos = current_colegio.alunos.where("id not in(#{MembroComissaoProGremio.all.map{ |m| m.id}.join(',')})")
    respond_with @comissao_pro_gremio
  end
  

  def new
    @comissao_pro_gremio = ComissaoProGremio.new
    authorize @comissao_pro_gremio
    
    respond_with(@comissao_pro_gremio)
  end


  def edit
    redirect_to @comissao_pro_gremio
  end


  def create
    @comissao_pro_gremio = ComissaoProGremio.new(comissao_pro_gremio_params)
    @comissao_pro_gremio.colegio = current_colegio
    authorize @comissao_pro_gremio
    
    if @comissao_pro_gremio.save
      flash[:info] = "Comissão Pró-Grêmio salva com sucesso"
    else
      flash[:warning] = "Não foi possível salvar os dados da Comissão Pró-Grêmio"
    end
    
    respond_with(@comissao_pro_gremio)
  end


  def update
    authorize @comissao_pro_gremio
    @comissao_pro_gremio.update(comissao_pro_gremio_params)
    respond_with(@comissao_pro_gremio)
  end


  def destroy
    authorize @comissao_pro_gremio
    @comissao_pro_gremio.destroy
    respond_with(@comissao_pro_gremio)
  end
  
  
  def adicionar_membro
    aluno = Aluno.find(params[:aluno_id])
    @comissao_pro_gremio.membros.find_or_create_by(:aluno_id => aluno.id)
    
    if @comissao_pro_gremio.save
      flash[:info] = "Membro salvo com sucesso"
    else
      flash[:warning] = "Não foi possível salvar o Membro"  
    end
    
    redirect_to @comissao_pro_gremio
  end
  
  
  def finalizar_cadastro
    @comissao_pro_gremio.finalizada = true
    
    if @comissao_pro_gremio.save
      flash[:info] = "Comissão Pró-Grêmio finalizada"
    else
      flash[:warning] = "Não foi possível salvar a Comissão Pró-Grêmio"
    end
    
    redirect_to @comissao_pro_gremio
  end
  
  
  private
    def set_comissao_pro_gremio
      @comissao_pro_gremio = ComissaoProGremio.find(params[:id])
    end

    def comissao_pro_gremio_params
      params.require(:comissao_pro_gremio).permit(:colegio_id)
    end
    
    def set_alunos_disponiveis
      # O Aluno pode fazer parte de apenas UMA das entidades abaixo...
      indisponiveis = current_colegio.comissao_pro_gremio.membros.collect { |m| m.aluno.id}.join(",")
      #indisponiveis += current_colegio.conselho_representantes_de_turma.representantes.collect { |r| r.aluno.id}.join(",")
      
      @alunos = current_colegio.alunos.where("id not in (#{indisponiveis}")
    end
end
