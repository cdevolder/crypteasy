class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :crypto
  has_many :alerts, dependent: :destroy

  validates :platform1, presence: true
  validates :platform2, presence: true
end
