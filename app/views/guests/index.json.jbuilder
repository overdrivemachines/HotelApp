json.array!(@guests) do |guest|
  json.extract! guest, :id, :first_name, :last_name, :address_line1, :address_line2, :city, :zip, :phone1, :phone2, :id_type, :dob, :id_state, :id_number, :email, :reservation_id
  json.url guest_url(guest, format: :json)
end
