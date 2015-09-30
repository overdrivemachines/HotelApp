json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :property_id, :arrival_date, :departure_date, :adults, :children, :room_type_id, :room_id, :rate, :notes
  json.url reservation_url(reservation, format: :json)
end
