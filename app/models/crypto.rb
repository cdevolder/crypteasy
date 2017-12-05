class Crypto < ApplicationRecord

  has_many :exchangetimevalues
  has_many :favorites
end
