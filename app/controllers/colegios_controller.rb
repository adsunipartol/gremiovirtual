# encoding: utf-8

class ColegiosController < ApplicationController
  before_action :set_colegio, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  
  def index
    @colegios = Colegio.all
    respond_with(@colegios)
  end

  def show
    authorize @colegio
    respond_with(@colegio)
  end

  def new
    @colegio = Colegio.new
    authorize @colegio
    
    respond_with(@colegio)
  end

  def edit
    authorize @colegio
  end

  def create
    @colegio = Colegio.new(colegio_params)
    @colegio.comissao_pro_gremio = ComissaoProGremio.new
    @colegio.conselho_representantes_de_turma = ConselhoRepresentantesDeTurma.new(ano_vigencia: Time.now.year)
    authorize @colegio
    
    if @colegio.save
      flash[:info] = "Colégio salvo com sucesso"
    else
      flash[:warning] = "Não foi possível salvar os dados do Colégio"
    end
    
    respond_with(@colegio)
  end

  def update
    authorize @colegio
    
    @colegio.update(colegio_params)
    respond_with(@colegio)
  end

  def destroy
    authorize @colegio
    
    @colegio.destroy
    respond_with(@colegio)
  end

  private
    def set_colegio
      @colegio = Colegio.find(params[:id])
    end

    def colegio_params
      params.require(:colegio).permit(:nome, :nome_completo, :cnpj, :email, :cep, :enderec, :bairro, :telefone, :fax, :cidade_id)
    end
    
    def permissao_negada
      flash[:warning] = "Você não "
      redirect_to(request.referrer || root_path)
    end
end
