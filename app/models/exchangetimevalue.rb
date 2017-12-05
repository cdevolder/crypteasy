class Exchangetimevalue < ApplicationRecord

  belongs_to :platform
  belongs_to :crypto

  validates :dollar, presence: true
  validates :euro, presence: true
  validates :yuan, presence: true


end
