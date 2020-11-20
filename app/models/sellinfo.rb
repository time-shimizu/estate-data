class Sellinfo < ApplicationRecord
  validates :address, presence: true
  validates :price, presence: true
  validates :area, presence: true
  validates :name, presence: true
end
