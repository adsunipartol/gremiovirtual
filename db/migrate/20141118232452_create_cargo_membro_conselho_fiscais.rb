class CreateCargoMembroConselhoFiscais < ActiveRecord::Migration
  def change
    create_table :cargo_membro_conselho_fiscais do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
