class Customer < ApplicationRecord
  has_many :orders
  has_many :tickets, through: :orders

  validates :name, :lastname, :email, presence:true
  validates :email, format:{with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :email, uniqueness:true
end
