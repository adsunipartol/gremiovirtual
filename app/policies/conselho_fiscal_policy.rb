# encoding: utf-8

class ConselhoFiscalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  
  
  def index?
    user.aluno? || user.funcionario? || user.admin?
  end
  
  def show?
    true
  end
  
  def create?
    return true if user.admin?
    
    if user.funcionario?
      f = Funcionario.find_by_email(user.email)
      return ['secretário(a)', 'diretor(a)'].include? f.cargo.descricao.downcase
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
  
  def adicionar_membro_efetivo?
    user.admin?
  end
  
  def adicionar_membro_suplente?
    user.admin?
  end
  
  def finalizar?
    if user.admin? || user.funcionario?
      return true unless record.finalizado 
    end
    
    false
  end
end
