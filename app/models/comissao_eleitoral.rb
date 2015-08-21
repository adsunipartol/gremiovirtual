class ComissaoEleitoral < ActiveRecord::Base
  belongs_to :gremio, inverse_of: :comissao_eleitoral
  
  has_many :membros, class_name: 'MembroComissaoEleitoral', inverse_of: :comissao_eleitoral
  
  
end
