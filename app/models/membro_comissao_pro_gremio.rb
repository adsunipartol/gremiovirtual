class MembroComissaoProGremio < ActiveRecord::Base
  belongs_to :aluno, inverse_of: :membro_comissao_pro_gremio
  belongs_to :comissao_pro_gremio, inverse_of: :membros
  
  
  
  # Validations
  validates_presence_of :aluno, :message => 'deve ser informado'
  validates_presence_of :comissao_pro_gremio, :message => 'deve ser informada'
end
