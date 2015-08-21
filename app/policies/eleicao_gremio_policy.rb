class EleicaoGremioPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  
  def show?
    user.admin? || user.funcionario? || user.aluno?
  end
  
  def new?
    create?
  end
  
  def create?
    if user.admin? || (is_aluno_and_membro_comissao_eleitoral? && user.aluno.colegio.gremio)
      return true
    end
    
    false
  end
  
  def edit?
    user.admin? || (is_aluno_and_membro_comissao_eleitoral?)
  end
  
  def update?
    edit?
  end
  
  def destroy?
    user.admin? || (is_aluno_and_membro_comissao_eleitoral?)
  end
  
  private
  
  def is_aluno_and_membro_comissao_eleitoral?
    user.aluno? && user.aluno.membro_comissao_eleitoral?
  end
end
