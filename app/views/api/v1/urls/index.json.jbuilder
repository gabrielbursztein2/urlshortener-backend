json.top_url do
  json.array! @top_url, :id, :url, :short_url, :visits
end
