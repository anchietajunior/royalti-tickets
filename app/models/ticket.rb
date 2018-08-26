class Ticket < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :admin, class_name: "User"
  belongs_to :user, class_name: "User"
  belongs_to :priority, optional: true
  belongs_to :status, optional: true
end
