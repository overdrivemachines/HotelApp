json.array!(@room_type_rates) do |room_type_rate|
  json.extract! room_type_rate, :id, :room_type_id, :on_date, :rate
  json.url room_type_rate_url(room_type_rate, format: :json)
end
