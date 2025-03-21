class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :notes, dependent: :destroy

  has_many :discutes, dependent: :destroy
  has_many :discussions, through: :discutes

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
