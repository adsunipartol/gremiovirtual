class CargoRepresentanteDeTurma < ActiveRecord::Base
  has_many :representantes, class_name: 'RepresentanteDeTurma', inverse_of: :cargo
  
end
