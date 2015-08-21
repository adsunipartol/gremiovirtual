class CreateGremios < ActiveRecord::Migration
  def change
    create_table :gremios do |t|
      t.string :nome
      t.integer :ano_vigencia, uniqueness: true
      t.integer :chapa_eleita_id
      t.references :colegio, index: true
      
      t.timestamps
    end
  end
end
