json.array!(@courses) do |course|
  json.extract! course, :id, :name, :description, :picture, :department_id
  json.url course_url(course, format: :json)
end
