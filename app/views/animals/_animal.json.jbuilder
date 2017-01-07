json.extract! animal, :id, :name, :latin_name, :kingdom, :created_at, :updated_at
json.url animal_url(animal, format: :json)