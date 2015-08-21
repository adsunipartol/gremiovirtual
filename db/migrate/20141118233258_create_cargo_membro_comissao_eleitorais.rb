class CreateCargoMembroComissaoEleitorais < ActiveRecord::Migration
  def change
    create_table :cargo_membro_comissao_eleitorais do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
