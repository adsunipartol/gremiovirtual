class CreateRepresentanteDeTurmas < ActiveRecord::Migration
  def change
    create_table :representante_de_turmas do |t|
      t.references :aluno, index: true
      t.references :turma, index: true
      t.references :cargo_representante_de_turma
      t.references :conselho_representantes_de_turma
      
      t.timestamps
    end

    add_index :representante_de_turmas, ["cargo_representante_de_turma_id"], name: :index_representante_de_turmas_on_cargo_representante
    add_index :representante_de_turmas, ["conselho_representantes_de_turma_id"], name: :index_representante_de_turmas_on_conselho_rt
  end
end
