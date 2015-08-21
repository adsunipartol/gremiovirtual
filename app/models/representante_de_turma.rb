# ecoding: utf-8

class RepresentanteDeTurma < ActiveRecord::Base
  belongs_to :aluno, inverse_of: :representante_de_turma
  belongs_to :turma, inverse_of: :representantes
  belongs_to :cargo_representante_de_turma, inverse_of: :representantes
  
  belongs_to :conselho_representantes_de_turma, inverse_of: :representantes
  
  
  # Validations
  validates_presence_of :turma, :message => 'deve ser informada'
  validates_presence_of :aluno, :message => 'deve ser informado'
  #validates_presence_of :cargo, :message => 'deve ser informado'
  
  def cargo
    self.cargo_representante_de_turma
  end
  
  def lider?
    self.cargo.descricao.downcase == 'líder'
  end
  
  def vice_lider?
    self.cargo.descricao.downcase == 'vice-líder'
  end
  
end
