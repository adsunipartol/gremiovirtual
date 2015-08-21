json.array!(@alunos) do |aluno|
  json.extract! aluno, :id, :nome, :email,
  json.url aluno_url(aluno, format: :json)
end
