class Alert < ApplicationRecord
  belongs_to :favorite
  belongs_to :user
end
