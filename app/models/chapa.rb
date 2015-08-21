class Chapa < ActiveRecord::Base
  belongs_to :eleicao_gremio, inverse_of: :chapas
  
  #has_many :membros, class_name: :MembroChapa, inverse_of: :chapa
  has_many :membro_chapas, inverse_of: :chapa
  accepts_nested_attributes_for :membro_chapas, :allow_destroy => true
  
  # Validations
  validates_presence_of :nome, :message => 'deve ser informado'
  
  def membros
    membro_chapas
  end
  
end
