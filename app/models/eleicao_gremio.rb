class EleicaoGremio < ActiveRecord::Base
  belongs_to :colegio, inverse_of: :eleicao_gremios
  belongs_to :gremio, inverse_of: :eleicao_gremio 
  
  
  has_many :chapas, inverse_of: :eleicao_gremio
  
  
  # Validations
  validates_presence_of :data_inicio_inscricoes, :message => 'deve ser informada'
  validates_presence_of :data_termino_inscricoes, :message => 'deve ser informada'
  validates_presence_of :data_votacao, :message => 'deve ser informada'
  
  
  def chapa_eleita
    chapas.where(eleita: true)
  end
  
end
