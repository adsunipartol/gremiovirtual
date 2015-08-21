class MembroConselhoFiscal < ActiveRecord::Base
  
  belongs_to :conselho_fiscal
  belongs_to :cargo_membro_conselho_fiscal
  belongs_to :aluno
  
  
  # Validations
  validates_presence_of :aluno
  validates_presence_of :conselho_fiscal
  validates_presence_of :cargo_membro_conselho_fiscal
  
  
  
  
end
