class User < ApplicationRecord
	#ACCESSORS
  attr_accessor :remember_me

  #VALIDATIONS
  validates :name, presence: true
  validates :email, presence: true
  
  #DEVISE
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  #RELATIONSHIPS
  has_many :admin_tickets, :class_name => "Ticket", :foreign_key => "admin_id"
  has_many :owned_tickets, :class_name => "Ticket", :foreign_key => "user_id"
  has_many :comments
end
