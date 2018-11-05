class Ticket < ApplicationRecord
  #RELASHIONSHIP
  belongs_to :customer, optional: true
  belongs_to :admin, class_name: "User"
  belongs_to :user, class_name: "User"
  belongs_to :priority, optional: true
  belongs_to :status, optional: true
  has_many   :comments

  #VALIDATIONS
  validates :description, presence: true
  validates :admin, presence: true
  validates :user, presence: true
  validates :priority, presence: true
  validates :status, presence: true

  #SCOPES
  scope :all_opened, -> {
        includes(:status).includes(:priority)
        .where('statuses.level = ?', 6).references(:status)
        .merge(Priority.order(level: :desc))
      }

  scope :opened_urgent_priority, -> {
        includes(:status).includes(:priority)
        .where('statuses.level = ?', 6).references(:status)
        .where('priorities.level = ?', 4).references(:priority)
      }

  scope :opened_high_priority, -> {
        includes(:status).includes(:priority)
        .where('statuses.level = ?', 6).references(:status)
        .where('priorities.level = ?', 3).references(:priority)
      }

  #METHODS
  def closed?
    self.status.level == 0
  end
end
