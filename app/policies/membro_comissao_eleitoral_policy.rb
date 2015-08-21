class MembroComissaoEleitoralPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  

  def show?
    user.aluno? || user.funcionario? || user.admin?
  end
  
  def new?
    create?
  end
  
  def create?
    user.admin?
  end
  
  def edit?
    update?
  end
  
  def update?
    user.admin?
  end
  
  def destroy?
    user.admin? && record.comissao_eleitoral.finalizada == false
  end
end
