class CreateMembroChapas < ActiveRecord::Migration
  def change
    create_table :membro_chapas do |t|
      t.references :aluno, index: true, index: true
      t.references :chapa, index: true, index: true
      t.references :cargo_membro_chapa, index: true

      t.timestamps
    end
  end
end
