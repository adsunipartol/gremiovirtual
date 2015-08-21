json.array!(@membro_comissao_pro_gremios) do |membro_comissao_pro_gremio|
  json.extract! membro_comissao_pro_gremio, :id, :aluno_id, :comissao_pro_gremio_id
  json.url membro_comissao_pro_gremio_url(membro_comissao_pro_gremio, format: :json)
end
