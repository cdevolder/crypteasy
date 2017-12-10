class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :crypto
  has_many :alerts
end
