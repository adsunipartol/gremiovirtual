json.array!(@funcionarios) do |funcionario|
  json.extract! funcionario, :id, :nome, :cpf, :email, :colegio_id, :cargo_funcionario_id
  json.url funcionario_url(funcionario, format: :json)
end
