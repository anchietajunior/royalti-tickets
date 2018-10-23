class Ticket < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :admin, class_name: "User"
  belongs_to :user, class_name: "User"
  belongs_to :priority, optional: true
  belongs_to :status, optional: true

  #Scopes
  scope :all_opened, -> { includes(:status).includes(:priority).where('statuses.level = ?', 0).references(:status).merge(Priority.order(level: :desc)) }
  scope :opened_high_priority, -> { includes(:status).includes(:priority).where('statuses.level = ?', 0).references(:status).where('priorities.level = ?', 5).references(:priority) }
end
