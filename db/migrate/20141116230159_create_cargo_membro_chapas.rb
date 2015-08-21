class CreateCargoMembroChapas < ActiveRecord::Migration
  def change
    create_table :cargo_membro_chapas do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
