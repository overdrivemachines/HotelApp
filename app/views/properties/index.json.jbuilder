json.array!(@properties) do |property|
  json.extract! property, :id, :name, :address_line1, :address_line2, :city, :state, :zip, :phone, :fax, :email
  json.url property_url(property, format: :json)
end
