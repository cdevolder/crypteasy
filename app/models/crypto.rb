class Crypto < ApplicationRecord

  has_many :exchangetimevalues
  has_many :favorites

  validates :name, presence: true, uniqueness: true
  validates :accronym, presence: true


end
