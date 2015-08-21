# encoding: utf-8

class MembroChapa < ActiveRecord::Base
  belongs_to :chapa, inverse_of: :membro_chapas
  belongs_to :aluno, inverse_of: :membro_chapa
  belongs_to :cargo_membro_chapa, inverse_of: :membro_chapa
  
  
  # Validations
  validates_presence_of :aluno, :message => 'deve ser informado'
  validates_presence_of :cargo_membro_chapa, :message => 'deve ser informado'
  validates_presence_of :chapa, :message => 'deve ser informada'
  
  
  def cargo
    self.cargo_membro_chapa
  end
  
end