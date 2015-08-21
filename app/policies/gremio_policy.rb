class GremioPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  
  def new?
    return false if current_colegio.gremio
    
    is_aluno_and_membro_comissao_eleitoral?
  end
  
  def edit?
    user.admin?
  end
  
  def create?
    user.admin? || is_aluno_and_membro_comissao_eleitoral?
  end
  
  def update?
    is_aluno_and_membro_comissao_eleitoral?
  end
  
  def destroy?
    is_aluno_and_membro_comissao_eleitoral?
  end
  
  private
  
  def is_aluno_and_membro_comissao_eleitoral?
    return false unless user.aluno?
    
    aluno = Aluno.find_by_email(user.email)
    aluno.membro_comissao_eleitoral?
  end
end
