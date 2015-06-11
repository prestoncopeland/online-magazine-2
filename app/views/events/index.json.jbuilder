json.array!(@events) do |event|
  json.extract! event, :id, :title, :start_date, :end_date, :description, :category, :address, :city, :state, :telephone, :email
  json.url event_url(event, format: :json)
end
