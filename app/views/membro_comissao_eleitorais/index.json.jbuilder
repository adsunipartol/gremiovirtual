json.array!(@membro_comissao_eleitorais) do |membro_comissao_eleitoral|
  json.extract! membro_comissao_eleitoral, :id, :comissao_eleitoral_id, :aluno_id
  json.url membro_comissao_eleitoral_url(membro_comissao_eleitoral, format: :json)
end
