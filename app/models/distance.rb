class Distance < ApplicationRecord
  validates :sellinfo_id, presence: true
  validates :buyinfo_id, presence: true
  validates :distance, presence: true
end
