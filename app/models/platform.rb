class Platform < ApplicationRecord

  has_many :exchangetimevalues
  has_many :favorites
  has_many :cryptos, through: :exchangetimevalues

  validates :name, presence: true
  validates :description, presence: true

end
