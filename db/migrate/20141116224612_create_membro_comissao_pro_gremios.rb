class CreateMembroComissaoProGremios < ActiveRecord::Migration
  def change
    create_table :membro_comissao_pro_gremios do |t|
      t.references :aluno, index: true
      t.references :comissao_pro_gremio, index: true

      t.timestamps
    end
  end
end
