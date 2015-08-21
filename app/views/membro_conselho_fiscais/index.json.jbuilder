json.array!(@membro_conselho_fiscais) do |membro_conselho_fiscal|
  json.extract! membro_conselho_fiscal, :id, :cargo_membro_conselho_fiscal_id, :aluno_id
  json.url membro_conselho_fiscal_url(membro_conselho_fiscal, format: :json)
end
