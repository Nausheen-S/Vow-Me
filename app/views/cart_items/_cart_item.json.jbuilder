json.extract! cart_item, :id, :customer_id, :quantity, :product_id, :created_at, :updated_at
json.url cart_item_url(cart_item, format: :json)
