class CreateMembroConselhoFiscais < ActiveRecord::Migration
  def change
    create_table :membro_conselho_fiscais do |t|
      t.references :aluno, index: true
      t.references :cargo_membro_conselho_fiscal
      t.references :conselho_fiscal, index: true
      t.boolean :suplente, default: false
      t.boolean :efetivo, default: false
      
      t.timestamps
    end
    
    add_index :membro_conselho_fiscais, ["cargo_membro_conselho_fiscal_id"], name: :index_membro_conselho_fiscais_on_cargo_membro_conselho_fiscal
  end
end
