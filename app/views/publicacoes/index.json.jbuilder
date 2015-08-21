json.array!(@publicacoes) do |publicacao|
  json.extract! publicacao, :id, :aluno_id, :data, :hora, :titulo, :conteudo
  json.url publicacao_url(publicacao, format: :json)
end
