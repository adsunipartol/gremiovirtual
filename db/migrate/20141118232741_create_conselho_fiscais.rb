class CreateConselhoFiscais < ActiveRecord::Migration
  def change
    create_table :conselho_fiscais do |t|
      t.references :gremio, index: true
      t.integer :ano_vigencia, index: true
      t.boolean :finalizado, default: false
      
      t.timestamps
    end
  end
end
