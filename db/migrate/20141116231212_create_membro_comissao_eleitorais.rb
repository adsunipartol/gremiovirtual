class CreateMembroComissaoEleitorais < ActiveRecord::Migration
  def change
    create_table :membro_comissao_eleitorais do |t|
      t.references :aluno, index: true
      t.references :comissao_eleitoral, index: true

      t.timestamps
    end
  end
end
