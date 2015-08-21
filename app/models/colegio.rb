# encoding: utf-8

class Colegio < ActiveRecord::Base
  
  has_many :alunos, inverse_of: :colegio
  has_many :turmas, inverse_of: :colegio
  has_many :funcionarios, inverse_of: :colegio
  
  has_one :conselho_representantes_de_turma, inverse_of: :colegio
  has_one :comissao_pro_gremio, inverse_of: :colegio
  has_one :gremio, inverse_of: :colegio
  
  has_many :eleicao_gremios, inverse_of: :colegio
  
  #has_one :assembleia_geral, inverse_of: :colegio
  
  belongs_to :cidade
  
  
  
  # Validations
  validates_presence_of :nome, :message => 'deve ser informado'
  
  
  def alunos_ativos
    alunos.where(ativo: true)
  end
  
  def representantes_de_turma
    conselho_representantes_de_turma.representantes
  end
  
  # Funcionários do Colégios
  def diretor
    @diretor ||= self.funcionarios.find_by(cargo_funcionario_id: CargoFuncionario.find_by_descricao('Diretor(a)').id)
  end

  def secretarias
    @secretarias ||= self.funcionarios.find_by(cargo_funcionario: CargoFuncionario.find_by_descricao('Secretário(a)').id)
  end
  
  def professores
    @professores ||= self.funcionarios.find_by(cargo_funcionario: CargoFuncionario.find_by_descricao('Professor(a)').id)
  end
    
end
