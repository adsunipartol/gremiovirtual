json.array!(@representante_de_turmas) do |representante_de_turma|
  json.extract! representante_de_turma, :id, :turma_id, :aluno_id
  json.url representante_de_turma_url(representante_de_turma, format: :json)
end
