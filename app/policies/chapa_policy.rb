class ChapaPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  
  def index?
    user.aluno? || user.funcionario? || user.admin?
  end
  
  def new?
    create?
  end
  
  def create?
    user.admin? || (user.aluno? && user.aluno.membro_comissao_eleitoral?)
  end
  
  def edit?
    update?
  end
  
  def update?
    user.admin? || (user.aluno? && user.aluno.membro_comissao_eleitoral? && record.finalizada == false)
  end
  
  def destroy?
    user.admin? || (user.aluno? && user.membro_comissao_eleitoral?)
  end
  
  def adicionar_membro?
    user.admin?
  end
  
  def finalizar_cadastro?
    (user.admin? || (user.aluno? && user.aluno.membro_comissao_eleitoral?)) && record.persisted? && record.finalizada == false
  end
  
  def votar?
    user.aluno?
  end
  
end
