class Platform < ApplicationRecord

  has_many :exchangetimevalues
  has_many :favorites

end
