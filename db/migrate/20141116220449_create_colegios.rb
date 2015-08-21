class CreateColegios < ActiveRecord::Migration
  def change
    create_table :colegios do |t|
      t.string :nome
      t.string :nome_completo
      t.string :cnpj, uniqueness: true
      t.string :email, uniqueness: true
      t.string :cep
      t.string :endereco
      t.string :bairro
      t.string :telefone
      t.string :fax
      t.references :cidade, index: true
      t.references :comissao_pro_gremio, index: true
      t.references :gremio, index: true

      t.timestamps
    end
  end
end
