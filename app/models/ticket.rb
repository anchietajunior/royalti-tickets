class Ticket < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :admin, class_name: "User"
  belongs_to :user, class_name: "User"
  belongs_to :priority, optional: true
  belongs_to :status, optional: true

  #Scopes
  scope :all_opened, -> { includes(:status).where('statuses.level = ?', 0).references(:status) }
  scope :high_priority, -> { includes(:priority).where('priorities.level = ?', 0).references(:priority) }
end
