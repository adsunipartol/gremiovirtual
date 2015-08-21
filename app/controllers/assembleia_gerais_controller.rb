class AssembleiaGeraisController < ApplicationController
  before_action :set_assembleia_geral, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  def index
    @assembleias_gerais = AssembleiaGeral.all
    
    authorize @assembleias_gerais
    
    respond_with(@assembleias_gerais)
  end

  def show
    respond_with(@assembleia_geral)
  end

  def new
    @assembleia_geral = AssembleiaGeral.new
    respond_with(@assembleia_geral)
  end

  def edit
  end

  def create
    @assembleia_geral = AssembleiaGeral.instancia
    @assembleia_geral.save
    respond_with(@assembleia_geral)
  end

  def update
    @assembleia_geral.update(assembleia_geral_params)
    respond_with(@assembleia_geral)
  end

  def destroy
    @assembleia_geral.destroy
    respond_with(@assembleia_geral)
  end

  private
    def set_assembleia_geral
      @assembleia_geral = AssembleiaGeral.find(params[:id])
    end

    def assembleia_geral_params
      params.require(:assembleia_geral).permit(:colegio_id)
    end
end
