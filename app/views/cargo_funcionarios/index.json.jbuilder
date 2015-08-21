json.array!(@cargo_funcionarios) do |cargo_funcionario|
  json.extract! cargo_funcionario, :id, :descricao
  json.url cargo_funcionario_url(cargo_funcionario, format: :json)
end
