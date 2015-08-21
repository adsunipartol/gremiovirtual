class CreateModeloEstatutos < ActiveRecord::Migration
  def change
    create_table :modelo_estatutos do |t|
      t.references :comissao_pro_gremio, index: true
      t.boolean :aprovado, default: false
      t.text :estatuto

      t.timestamps
    end
  end
end
