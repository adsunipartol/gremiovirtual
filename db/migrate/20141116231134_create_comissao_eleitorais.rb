class CreateComissaoEleitorais < ActiveRecord::Migration
  def change
    create_table :comissao_eleitorais do |t|
      t.references :gremio, index: true
      t.integer :ano_vigencia, uniqueness: true
      t.boolean :finalizada, default: false
      
      t.timestamps
    end
  end
end
