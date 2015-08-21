class MembroComissaoEleitoral < ActiveRecord::Base
  belongs_to :aluno
  belongs_to :comissao_eleitoral
  belongs_to :cargo_membro_comissao_eleitoral
  
  
  
  def cargo
    self.cargo_membro_comissao_eleitoral
  end
  
end
