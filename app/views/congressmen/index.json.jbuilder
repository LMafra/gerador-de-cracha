json.array!(@congressmen) do |congressman|
  json.extract! congressman, :id, :name, :ej, :area, :lecture
  json.url congressman_url(congressman, format: :json)
end
