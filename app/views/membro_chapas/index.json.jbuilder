json.array!(@membro_chapas) do |membro_chapa|
  json.extract! membro_chapa, :id, :chapa_id, :aluno_id
  json.url membro_chapa_url(membro_chapa, format: :json)
end
