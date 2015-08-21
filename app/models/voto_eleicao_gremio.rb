class VotoEleicaoGremio < ActiveRecord::Base
  belongs_to :eleicao_gremio
  belongs_to :chapa
  belongs_to :aluno
  
end
