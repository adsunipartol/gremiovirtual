class CargoFuncionario < ActiveRecord::Base
  has_many :funcionarios, inverse_of: :cargo_funcionario
  
end
