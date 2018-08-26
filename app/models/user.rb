class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :admin_tickets, :class_name => "Ticket", :foreign_key => "admin_id"
  has_many :owned_tickets, :class_name => "Ticket", :foreign_key => "user_id"
end
