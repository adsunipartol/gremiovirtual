class ModeloEstatutosController < ApplicationController
  before_action :set_modelo_estatuto, only: [:show, :edit, :update, :destroy]

  def index
    @modelo_estatutos = ModeloEstatuto.all
    respond_with(@modelo_estatutos)
  end

  def show
    respond_with(@modelo_estatuto)
  end

  def new
    @modelo_estatuto = ModeloEstatuto.new
    respond_with(@modelo_estatuto)
  end

  def edit
  end

  def create
    @modelo_estatuto = ModeloEstatuto.new(modelo_estatuto_params)
    @modelo_estatuto.save
    respond_with(@modelo_estatuto)
  end

  def update
    @modelo_estatuto.update(modelo_estatuto_params)
    respond_with(@modelo_estatuto)
  end

  def destroy
    @modelo_estatuto.destroy
    respond_with(@modelo_estatuto)
  end

  private
    def set_modelo_estatuto
      @modelo_estatuto = ModeloEstatuto.find(params[:id])
    end

    def modelo_estatuto_params
      params.require(:modelo_estatuto).permit(:comissao_pro_gremio_id, :aprovado, :estatuto)
    end
end
