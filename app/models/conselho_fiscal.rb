class ConselhoFiscal < ActiveRecord::Base
  belongs_to :gremio, inverse_of: :conselho_fiscal
  
  has_many :membros, class_name: 'MembroConselhoFiscal', inverse_of: :conselho_fiscal
  
end
