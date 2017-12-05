class Favorite < ApplicationRecord
  belongs_to :crypto
  belongs_to :platform
  belongs_to :user
end
