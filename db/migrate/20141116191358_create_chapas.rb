class CreateChapas < ActiveRecord::Migration
  def change
    create_table :chapas do |t|
      t.string :nome
      t.text :plano_de_trabalho
      t.boolean :eleita, default: false
      t.boolean :finalizada, default: false
      t.references :eleicao_gremio, index: true
      
      t.timestamps
    end
  end
end