json.array!(@cargo_membro_chapas) do |cargo_membro_chapa|
  json.extract! cargo_membro_chapa, :id, :descricao
  json.url cargo_membro_chapa_url(cargo_membro_chapa, format: :json)
end
