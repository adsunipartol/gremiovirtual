json.array!(@conselho_fiscais) do |conselho_fiscal|
  json.extract! conselho_fiscal, :id, :gremio_id
  json.url conselho_fiscal_url(conselho_fiscal, format: :json)
end
