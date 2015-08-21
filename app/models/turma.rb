# encoding: utf-8

class Turma < ActiveRecord::Base
  belongs_to :colegio, inverse_of: :turmas
  
  has_many :alunos, -> {where ativo: true}, inverse_of: :turma
  
  has_many :representantes, class_name: 'RepresentanteDeTurma', inverse_of: :turma
  
  
  # Validations
  validates_presence_of :serie, :message => 'deve ser informada'
  validates_presence_of :turno, :message => 'deve ser informado'
  validates_presence_of :ensino, :message => 'deve ser informado'
  validates_presence_of :colegio, :message => 'deve ser informado'
  
  
  def nome
    "#{self.turno} - #{self.serie} Série do Ensino #{self.ensino} "
  end
  
  def lider
    @lider = self.representantes.find_by_cargo_representante_de_turma_id(CargoRepresentanteDeTurma.find_by_descricao('Líder').id)
  end
  
  def vice_lider
    @vice_lider = self.representantes.find_by(cargo_representante_de_turma_id: CargoRepresentanteDeTurma.find_by_descricao('Vice-Líder').id)
  end
  
  def possui_lider?
    not lider.nil?
  end
  
  def possui_vice_lider?
    not vice_lider.nil?
  end
  
  
end
