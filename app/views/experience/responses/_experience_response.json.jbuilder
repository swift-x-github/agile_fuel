json.extract! experience_response, :id, :name, :raiting, :ip, :experience_id, :created_at, :updated_at
json.url experience_response_url(experience_response, format: :json)
