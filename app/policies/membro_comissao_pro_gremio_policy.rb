class MembroComissaoProGremioPolicy < ApplicationPolicy
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
    user.funcionario? || user.admin?
  end
  
  def edit?
    update?
  end
  
  def update?
    user.funcionario? || user.admin?
  end
  
  def destroy?
    (user.funcionario? || user.admin?) && record.comissao_pro_gremio.finalizada == false
  end
  
end
