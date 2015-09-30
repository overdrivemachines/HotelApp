json.array!(@rooms) do |room|
  json.extract! room, :id, :property_id, :room_number, :room_type_id, :location, :status
  json.url room_url(room, format: :json)
end
