class ModeloEstatuto < ActiveRecord::Base
  belongs_to :comissao_pro_gremio, inverse_of: :modelo_estatuto
  
end
