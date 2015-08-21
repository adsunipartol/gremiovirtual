# encoding: utf-8

class ComissaoProGremioPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  def index?
    user.aluno? || user.funcionario? || user.admin?
  end
  
  def show?
    user.aluno? || user.funcionario? || user.admin?
  end
  
  # Apenas Funcionários(Secretário(a), Diretor(a)) podem criar uma Comissão Pró-Grêmio
  # Só existirá uma Comissão Pró-Grêmio!
  def create?
    if user.funcionario?
      f = Funcionario.find_by_cpf(user.cpf)
      
      if ['secretário(a)', 'diretor(a)'].include? f.cargo.descricao.downcase
        true
      else
        false
      end
    else
      false
    end
  end
  
  def new?
    create?
  end
  
  def update?
    user.admin? || user.funcionario?
  end
  
  def destroy?
    user.admin?
  end
  
  def adicionar_membro?
    (user.admin? || user.funcionario?) && record.finalizada == false
  end
  
  def finalizar?
    (user.admin? || user.funcionario?) && record.finalizada == false && record.membros.count > 0
  end
  
end
