class Priority < ApplicationRecord
  has_many :tickets

  validates :name, presence: true
  validates :level, presence: true
end
