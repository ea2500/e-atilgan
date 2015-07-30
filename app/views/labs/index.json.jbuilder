json.array!(@labs) do |lab|
  json.extract! lab, :id, :name, :college
  json.url lab_url(lab, format: :json)
end
