json.array!(@messages) do |message|
  json.extract! message, :FromUserId, :ToUserId, :SubjectTitle, :Body
  json.url message_url(message, format: :json)
end