json.array!(@cargo_representante_de_turmas) do |cargo_representante_de_turma|
  json.extract! cargo_representante_de_turma, :id, :descricao
  json.url cargo_representante_de_turma_url(cargo_representante_de_turma, format: :json)
end
