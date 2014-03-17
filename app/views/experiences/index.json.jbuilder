json.array!(@experiences) do |experience|
  json.extract! experience, :id, :pseudonym, :title, :body, :hearts
  json.url experience_url(experience, format: :json)
end
