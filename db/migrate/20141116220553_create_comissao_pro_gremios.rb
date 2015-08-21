class CreateComissaoProGremios < ActiveRecord::Migration
  def change
    create_table :comissao_pro_gremios do |t|
      t.references :colegio, index: true
      t.boolean :finalizada, default: false
      
      t.timestamps
    end
  end
end
