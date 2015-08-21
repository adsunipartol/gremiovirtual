class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
      t.integer :ano_vigencia, uniqueness: true
      t.string :serie
      t.string :turno
      t.string :ensino
      t.references :colegio, index: true

      t.timestamps
    end
  end
end
