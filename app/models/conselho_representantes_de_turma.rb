class ConselhoRepresentantesDeTurma < ActiveRecord::Base
  belongs_to :colegio, inverse_of: :conselho_representantes_de_turma
  has_many :representantes, class_name: 'RepresentanteDeTurma', inverse_of: :conselho_representantes_de_turma
  
  
  # Validations
  validates_presence_of :ano_vigencia, :message => 'deve ser informado' 
  
end
