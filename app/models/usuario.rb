# encoding: utf-8

class Usuario < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable,
         :trackable, 
         :validatable
  
  # relationships
  belongs_to :aluno       # O Usuario pode ser um Aluno...
  belongs_to :funcionario # ... ou um Funcionario do colégio.
  
  belongs_to :colegio  # Usuário do sistema de UM Colégio
  
  # Validations
  validates_presence_of :email, :message => 'deve ser informado'
  validates_uniqueness_of :email, :message => 'em uso'
  
  def primeiro_nome
    (self.nome + ' ').split(' ').first.humanize
  end
  
  def ativar!
    self.ativo = true
  end
  
  
  # "Papéis"
  def admin?
    self.admin
  end
  
  def funcionario?
    Funcionario.exists?(email: self.email)
  end
  
  def funcionario
    Funcionario.find_by(email: self.email)
  end
  
  def aluno?
    Aluno.exists?(email: self.email)
  end
  
  def aluno
    Aluno.find_by(email: self.email)
  end
  
  def aluno_or_funcionario?
    aluno? || funcionario?
  end
  
  def admin_or_funcionario?
    admin? || funcionario?
  end
  
end