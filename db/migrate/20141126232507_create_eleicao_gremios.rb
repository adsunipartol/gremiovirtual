class CreateEleicaoGremios < ActiveRecord::Migration
  def change
    create_table :eleicao_gremios do |t|
      t.date :data_inicio_inscricoes
      t.date :data_termino_inscricoes
      t.date :data_votacao
      t.references :gremio, index: true
      t.references :colegio, index: true
      
      t.timestamps
    end
  end
end
