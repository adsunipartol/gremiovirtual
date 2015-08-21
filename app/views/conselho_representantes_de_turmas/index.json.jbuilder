json.array!(@conselho_representantes_de_turmas) do |conselho_representantes_de_turma|
  json.extract! conselho_representantes_de_turma, :id, :gremio_id
  json.url conselho_representantes_de_turma_url(conselho_representantes_de_turma, format: :json)
end
