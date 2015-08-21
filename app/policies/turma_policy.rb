class TurmaPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  def index?
    user.funcionario? || user.admin?
  end
  
  def edit?
    false
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
  
  def adicionar_representante?
    if user.admin?
      (record.representantes.count < CargoRepresentanteDeTurma.count) && record.alunos.count > 0
    else
      false
    end
  end
end
