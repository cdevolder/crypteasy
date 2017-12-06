class Favorite < ApplicationRecord

  belongs_to :crypto
  has_many :platform
  belongs_to :user

end
