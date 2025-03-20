class Discussion < ApplicationRecord
  has_many :discutes, dependent: :destroy
  has_many :users, through: :discutes
  
  #has_many :notes, dependent: :destroy
end
