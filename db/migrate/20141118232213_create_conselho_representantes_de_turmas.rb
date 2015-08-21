class CreateConselhoRepresentantesDeTurmas < ActiveRecord::Migration
  def change
    create_table :conselho_representantes_de_turmas do |t|
      t.references :colegio, index: true
      t.integer :ano_vigencia, uniqueness: true
      
      t.timestamps
    end
  end
end
