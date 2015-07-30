json.array!(@documents) do |document|
  json.extract! document, :id, :name, :doc_file
  json.url document_url(document, format: :json)
end
