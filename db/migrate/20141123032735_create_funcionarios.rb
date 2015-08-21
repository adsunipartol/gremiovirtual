class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :cpf
      t.string :email
      t.string :telefone
      t.references :colegio, index: true
      t.references :cargo_funcionario, index: true
      t.references :cidade, index: true

      t.timestamps
    end
  end
end
