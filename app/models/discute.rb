class Discute < ApplicationRecord
  belongs_to :user
  belongs_to :discussion

  validates :role, presence: true
end
