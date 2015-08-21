json.array!(@cargo_membro_comissao_eleitorais) do |cargo_membro_comissao_eleitoral|
  json.extract! cargo_membro_comissao_eleitoral, :id, :descricao
  json.url cargo_membro_comissao_eleitoral_url(cargo_membro_comissao_eleitoral, format: :json)
end
