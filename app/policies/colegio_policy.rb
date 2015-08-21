# encoding: utf-8

class ColegioPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  def index?
    user.admin?
  end
  
  def show?
    user.aluno? || user.funcionario? || user.admin?
  end
  
  def create?
    user.admin?
  end
  
  def edit?
    update?
  end
  
  def update?
    is_admin_or_diretor_or_secretario?
  end
  
  def destroy?
    user.admin?
  end
  
  
  private
  
  def is_admin_or_diretor_or_secretario?
    if user.admin?
      true
    else
      if user.funcionario?
        Funcionario.find_by_cpf(user.cpf).cargo.descricao.titleize.in? ['Diretor(a)', 'Secretário(a)']
      else
        false
      end
    end
  end
  
end
