class PublicacoesController < ApplicationController
  before_action :set_publicacao, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  def index
    @publicacoes = Publicacao.all
    respond_with(@publicacoes)
  end

  def show
    respond_with(@publicacao)
  end

  def new
    @publicacao = Publicacao.new
    respond_with(@publicacao)
  end

  def edit
  end

  def create
    @publicacao = Publicacao.new(publicacao_params)
    @publicacao.save
    respond_with(@publicacao)
  end

  def update
    @publicacao.update(publicacao_params)
    respond_with(@publicacao)
  end

  def destroy
    @publicacao.destroy
    respond_with(@publicacao)
  end

  private
    def set_publicacao
      @publicacao = Publicacao.find(params[:id])
    end

    def publicacao_params
      params.require(:publicacao).permit(:aluno_id, :data, :hora, :titulo, :conteudo)
    end
end
