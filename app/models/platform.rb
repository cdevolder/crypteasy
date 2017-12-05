class Platform < ApplicationRecord

  has_many :exchangetimevalues
  has_many :favorites

  validates :name, presence: true
  validates :description, presence: true

end
