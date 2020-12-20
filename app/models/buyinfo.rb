class Buyinfo < ApplicationRecord
  validates :address, presence: true
  validates :name, presence: true
  has_many :distances, dependent: :destroy
  enum kind: [:land, :building]
end
