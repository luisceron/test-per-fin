json.array!(@categories) do |category|
  json.extract! category, :id, :user_id, :name, :description
  json.url category_url(category, format: :json)
end
