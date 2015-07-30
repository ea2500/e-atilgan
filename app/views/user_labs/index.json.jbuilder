json.array!(@user_labs) do |user_lab|
  json.extract! user_lab, :id, :user_id, :lab_id
  json.url user_lab_url(user_lab, format: :json)
end
