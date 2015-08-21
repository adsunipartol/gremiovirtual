json.array!(@turmas) do |turma|
  json.extract! turma, :id, :serie, :turno, :ensino
  json.url turma_url(turma, format: :json)
end
