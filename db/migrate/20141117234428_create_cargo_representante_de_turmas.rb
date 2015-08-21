class CreateCargoRepresentanteDeTurmas < ActiveRecord::Migration
  def change
    create_table :cargo_representante_de_turmas do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
