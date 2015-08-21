# encoding: utf-8

class Funcionario < ActiveRecord::Base
  has_one :usuario
  belongs_to :colegio, inverse_of: :funcionarios
  belongs_to :cargo_funcionario, inverse_of: :funcionarios
  
  
  # Validations
  validates_presence_of :cpf, :message => 'deve ser informado'
  validates_presence_of :nome, :message => 'deve ser informado'
  validates_presence_of :email, :message => 'deve ser informado'
  validates_presence_of :colegio, :message => 'deve ser informado'
  validates_presence_of :cargo_funcionario, :message => 'deve ser informado'
  
  validates_uniqueness_of :cpf, :message => 'em uso'
  validates_uniqueness_of :email, :message => 'em uso'
  
  def cargo
    cargo_funcionario
  end
  
  def diretor_or_diretora?
    self.cargo.descricao == 'Diretor(a)'
  end
  
  def professor_or_professora?
    self.cargo.descricao == 'Professor(a)'
  end
  
  def secretario_or_secretaria?
    self.cargo.descricao == 'Secretário(a)'
  end
  
end
