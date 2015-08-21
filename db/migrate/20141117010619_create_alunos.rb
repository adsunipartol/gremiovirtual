class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string :matricula, uniqueness: true
      t.string :nome
      t.string :cpf, uniqueness: true
      t.string :email, uniqueness: true
      t.string :email_secundario
      t.string :endereco
      t.string :cep
      t.string :bairro
      t.string :telefone_principal
      t.string :telefone_secundario
      t.date :dtnascimento
      t.boolean :formado, default: false
      t.boolean :ativo, default: false
      t.references :turma, index: true
      t.references :colegio, index: true
      t.references :usuario, index: true
      t.references :cidade, index: true
      
      t.timestamps
    end
  end
end
