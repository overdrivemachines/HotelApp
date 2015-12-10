json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :reservation_id, :description, :amount
  json.url transaction_url(transaction, format: :json)
end
