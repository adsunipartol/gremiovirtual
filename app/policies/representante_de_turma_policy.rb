class RepresentanteDeTurmaPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  
  def index?
    user.funcionario? || user.aluno? || user.admin?
  end
  
  def show?
    user.funcionario? || user.aluno? || user.admin?
  end
  
  def new?
    create?
  end
  
  def create?
    user.funcionario? || user.admin?
  end
  
  def update?
    user.funcionario? || user.admin?
  end
  
  def destroy?
    user.funcionario? || user.admin?
  end
  
  
end
