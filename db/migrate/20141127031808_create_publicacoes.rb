class CreatePublicacoes < ActiveRecord::Migration
  def change
    create_table :publicacoes do |t|
      t.references :usuario, index: true
      t.date :data
      t.time :hora
      t.string :titulo
      t.text :conteudo
      
      t.timestamps
    end
  end
end
