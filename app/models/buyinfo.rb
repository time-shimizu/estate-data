class Buyinfo < ApplicationRecord
  validates :address, presence: true
  validates :price, presence: true
  validates :area, presence: true
  validates :name, presence: true
  enum kind: [:land, :building]
end