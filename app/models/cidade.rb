class Cidade < ActiveRecord::Base
  belongs_to :estado
  
  
  def nome_completo
    "#{self.nome} - #{self.estado.sigla}"
  end
  
  def cidade_params
    params.require(:cidade).permit(:nome)
  end
end