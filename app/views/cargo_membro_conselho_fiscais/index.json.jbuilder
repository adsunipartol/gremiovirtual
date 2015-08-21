json.array!(@cargo_membro_conselho_fiscais) do |cargo_membro_conselho_fiscal|
  json.extract! cargo_membro_conselho_fiscal, :id, :descricao
  json.url cargo_membro_conselho_fiscal_url(cargo_membro_conselho_fiscal, format: :json)
end
