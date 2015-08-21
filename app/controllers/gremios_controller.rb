# encoding: utf-8

class GremiosController < ApplicationController
  before_action :set_gremio, only: [:show, :edit, :update, :destroy, :votacao]
  respond_to :html, :xml, :json
  
  def index
    @gremio = current_colegio.gremio
    if @gremio.nil?
      redirect_to new_gremio_path
    else
      redirect_to @gremio
    end
  end

  def show  
    authorize @gremio
    respond_with @gremio
  end

  def new
    @gremio = Gremio.new
  end

  def edit
    authorize @gremio
    respond_with @gremio
  end

  def create
    @gremio = Gremio.new(gremio_params)
    @gremio.colegio = current_colegio
    authorize @gremio
    
    if @gremio.save
      flash[:info] = "Grêmio salvo com sucesso"
    else
      flash[:warning] = "Não foi possível salvar os dados do Grêmio"
    end
    
    respond_with(@gremio)
  end

  def update
    @gremio.update(gremio_params)
    respond_with(@gremio)
  end

  def destroy
    @gremio.destroy
    respond_with(@gremio)
  end
  
  private
    def set_gremio
      @gremio = Gremio.find(params[:id])
    end

    def gremio_params
      params.require(:gremio).permit(:nome, :colegio_id)
    end
end
