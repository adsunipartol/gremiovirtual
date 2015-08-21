class ConselhoRepresentantesDeTurmaPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  
  def index?
    user.funcionario? || user.admin?
  end
  
  def show?
    user.admin? || user.funcionario? || user.aluno?
  end
  
  def new?
    create?
  end
  
  def create?
    true
  end
  
  def update?
    true
  end
  
  def destroy?
    true
  end
  
end
