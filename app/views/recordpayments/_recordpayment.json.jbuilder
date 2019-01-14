json.extract! recordpayment, :id, :user_id, :amount, :debt_id, :created_at, :updated_at
json.url recordpayment_url(recordpayment, format: :json)
