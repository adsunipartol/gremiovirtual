class CreateAssembleiaGerais < ActiveRecord::Migration
  def change
    create_table :assembleia_gerais do |t|
      t.references :colegio, index: true
      t.date :data_reuniao
      
      t.timestamps
    end
  end
end
