class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :notes, dependent: :destroy

  has_many :discutes, dependent: :destroy
  has_many :discussions, through: :discutes
  
  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
