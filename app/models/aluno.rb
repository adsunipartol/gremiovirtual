# encoding: utf-8

class Aluno < ActiveRecord::Base
  
  # Relacionamentos
  belongs_to :colegio, inverse_of: :alunos, autosave: true    # Pertence à um Colégio
  #belongs_to :socio_gremio, inverse_of: :aluno                # É sócio do Grêmio
  belongs_to :turma, inverse_of: :alunos                      # Pertence à uma Turma
  
  has_one :membro_comissao_pro_gremio, inverse_of: :aluno  # Pode ser Membro de Comissão Pró-Grêmio
  #belongs_to :membro_comissao_eleitoral, inverse_of: :aluno   # Pode ser Membro de Comissão Eleitoral
  #belongs_to :membro_conselho_fiscal, inverse_of: :aluno      # Pode ser Membro de Conselho Fiscal
  has_one :representante_de_turma, inverse_of: :aluno      # Pode ser Representante de Turma
  has_one :membro_chapa, inverse_of: :aluno                # Pode ser Membro de Chapa
  
  belongs_to :cidade
  
  
  # Validations
  validates_presence_of :matricula, :message => 'deve ser informada'
  validates_presence_of :turma, :message => 'deve ser informada'
  validates_presence_of :email, :message => 'deve ser informado'
  validates_presence_of :dtnascimento, :message => 'deve ser informada'
  validates_presence_of :cidade, :message => 'deve ser informada'
  
  validates_uniqueness_of :matricula, :message => 'em uso'
  validates_uniqueness_of :email, :message => 'em uso'
  
  #validates_format_of :dtnascimento, :with => /\d{2}\/\d{2}\/\d{4}/, :message => 'deve estar dd/mm/aaaa'
  
  
  def dtnascimento_formatted
    Time.now.strftime("%d/%m/%Y")
  end
  
  def dtnascimento_formatted=(value)
    self.dtnascimento = Time.parse(value)
  end
  
  def status
    self.ativo? ? 'Ativo' : 'Inativo'
  end
  
  # Métodos para verificar se o Aluno é Membro de alguma entidade relacionada ao Grêmio 
  def membro_comissao_eleitoral?
    MembroComissaoEleitoral.exists?(aluno_id: self.id)
  end
  
  def membro_comissao_pro_gremio?
    MembroComissaoEleitoral.exists?(aluno_id: self.id)
  end
  
  def membro_diretoria_gremio?
    self.colegio.gremio.diretoria.membros.exists?(aluno_id: self.id)
  end
  
  def membro_chapa?
    MembroChapa.exists?(aluno_id: self.id)
  end
  
  def membro_conselho_fiscal?
    MembroConselhoFiscal.exists?(aluno_id: self.id)
  end
  
  def representante_de_turma?
    RepresentanteDeTurma.exists?(aluno_id: self.id)
  end
end
