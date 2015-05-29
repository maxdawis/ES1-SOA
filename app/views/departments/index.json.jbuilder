json.array!(@departments) do |department|
  json.extract! department, :id, :name, :description, :picture
  json.url department_url(department, format: :json)
end
