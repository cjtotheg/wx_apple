json.extract! wx, :id, :street, :city, :state_or_province, :postal_code, :country, :created_at, :updated_at
json.url wx_url(wx, format: :json)
