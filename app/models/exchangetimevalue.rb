class Exchangetimevalue < ApplicationRecord

  belongs_to :platform
  belongs_to :crypto

  validates :dollars, presence: true
  validates :euros, presence: true
  validates :yuan, presnce: true

end
