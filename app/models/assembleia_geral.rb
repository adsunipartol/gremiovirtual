class AssembleiaGeral < ActiveRecord::Base
  belongs_to :colegio, inverse_of: :assembleia_geral
  
  belongs_to :gremio, inverse_of: :assembleia_geral
  
  
  #belongs_to :secretario, :class_name => :aluno
  
end
