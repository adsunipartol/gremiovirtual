class ComissaoEleitoralPolicy < ApplicationPolicy
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
  
  def new?
    create?
  end
  
  def create?
    user.admin? || (user.aluno? && user.aluno.membro_comissao_pro_gremio?)
  end
  
  def update?
    user.admin?
  end
  
  def destroy?
    user.admin?
  end
  
  def finalizar?
    admin_or_membro_comissao_pro_gremio? && record.finalizada == false
  end
  
  def adicionar_membro?
    admin_or_membro_comissao_pro_gremio? && record.finalizada == false
  end
  
  private
  
  def admin_or_membro_comissao_pro_gremio?
    (user.admin? || (user.aluno? && user.aluno.membro_comissao_pro_gremio?))
  end
end
