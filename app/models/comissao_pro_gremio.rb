class ComissaoProGremio < ActiveRecord::Base
  belongs_to :colegio, inverse_of: :comissao_pro_gremio
  
  has_many :membros, class_name: 'MembroComissaoProGremio', inverse_of: :comissao_pro_gremio
  
  has_one :modelo_estatuto, inverse_of: :comissao_pro_gremio
  
  
  
  # Validations
  validates_presence_of :colegio, :message => 'deve ser informado'
  
end
