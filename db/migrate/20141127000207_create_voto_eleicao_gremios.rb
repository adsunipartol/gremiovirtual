class CreateVotoEleicaoGremios < ActiveRecord::Migration
  def change
    create_table :voto_eleicao_gremios do |t|
      t.references :eleicao_gremio, index: true
      t.references :chapa, index: true
      t.references :aluno, index: true

      t.timestamps
    end
  end
end
