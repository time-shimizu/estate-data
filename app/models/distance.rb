class Distance < ApplicationRecord
  validates :sellinfo_id, presence: true
  validates :buyinfo_id, presence: true
  validates :distance, presence: true
  belongs_to :sellinfo
  belongs_to :buyinfo
  default_scope -> { order(distance: :asc) }
end
