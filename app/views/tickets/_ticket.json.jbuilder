json.extract! ticket, :id, :description, :customer_id, :created_by_id, :user_id, :priority_id, :status_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
