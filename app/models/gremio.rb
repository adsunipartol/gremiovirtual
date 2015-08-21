class Gremio < ActiveRecord::Base
  belongs_to :colegio, inverse_of: :gremio
  
  has_one :comissao_eleitoral, inverse_of: :gremio
  has_one :conselho_fiscal, inverse_of: :gremio
  
  has_one :eleicao_gremio, inverse_of: :gremio
  
  
  
  # Chapa Eleita
  def diretoria
    @diretoria = Chapa.find_by_id(self.chapa_eleita_id)
  end
  
  # Alunos Sócios do Grêmio
  def socios
    @socios ||= self.colegio.alunos_ativos
  end
  
  # Modelo do Estatuto (mediante aprovação da Assembléia Geral)
  def estatuto
    @estatuto ||= self.comissao_pro_gremio.modelo_estatuto.where(aprovado: true)
  end
  
end
