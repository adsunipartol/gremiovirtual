# encoding: utf-8

class ChapasController < ApplicationController
  before_action :set_chapa, only: [:show, :edit, :update, :destroy, :finalizar_cadastro, :votar]
  
  respond_to :html, :xml, :json
  
  
  # GET /chapas
  # GET /chapas.json
  def index
    @chapas = Chapa.all
    respond_with(@chapas)
  end

  # GET /chapas/1
  # GET /chapas/1.json
  def show
    #authorize @chapa
    @membros = @chapa.membros
    respond_with @chapa
  end

  # GET /chapas/new
  def new
    @chapa = Chapa.new
    authorize @chapa
    
    respond_with(@chapa)
  end

  # GET /chapas/1/edit
  def edit
    #authorize @chapa
    
    @membros = @chapa.membros
    alunos_indisponiveis = @membros.map{ |m| m.aluno.id }.join(',')
    @alunos = current_colegio.alunos_ativos.where("id not in (#{alunos_indisponiveis})")
    @cargos = CargoMembroChapa.where("id not in (#{@chapa.membros.map{ |m| m.cargo.id }.join(',')})")
  end

  # POST /chapas
  # POST /chapas.json
  def create
    @chapa = Chapa.new(chapa_params)
    @chapa.eleicao_gremio  
    
    authorize @chapa
    
    if @chapa.save
      flash[:info] = "Chapa salva com sucesso"
      redirect_to edit_chapa_path(@chapa)
    else
      flash[:warning] = "Não foi possível salvar a chapa"
      redirect_to new_chapa_path
    end
  end

  # PATCH/PUT /chapas/1
  # PATCH/PUT /chapas/1.json
  def update
    @chapa.finalizada = true
    @chapa.update(chapa_params)
    respond_with @chapa
  end

  # DELETE /chapas/1
  # DELETE /chapas/1.json
  def destroy
    @chapa.destroy
    redirect_to chapas_path
  end
  
  def finalizar_cadastro
    @chapa.finalizada = true
    
    if @chapa.save
      flash[:info] = "O cadastro da chapa foi encerrado"
    else
      flash[:warning] = "Não foi possível encerrar o cadastro da chapa"
    end
    
    redirect_to @chapa
  end
  
  def votar
    authorize @chapa
    voto = VotoEleicaoGremio.new(voto_params)
    voto.aluno = current_usuario.aluno
    
    if voto.save
      flash[:info] = "Seu voto foi salvo com sucesso"
    else
      flash[:warning] = "Não foi possível efetuar o seu voto"
    end
    
    redirect_to @chapa
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapa
      @chapa = Chapa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapa_params
      params.require(:chapa).permit(:nome, membro_chapas_attributes: [:aluno_id, :cargo_membro_chapa_id])
    end
    
    def new_membro_chapa_params
      params.permit(:aluno_id, :chapa_id, :cargo_membro_chapa_id)
    end
    
    def voto_params
      params.permit(:chapa_id, :eleicao_gremio_id, :aluno_id)
    end
end