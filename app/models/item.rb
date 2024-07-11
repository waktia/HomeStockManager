class Item < ApplicationRecord
  belongs_to :user
  belongs_to :main_category, optional: true
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50}
  validates :stock, presence: true, numericality: { only_integer: true,  greater_than_or_equal_to: 0}
  validates :days, presence: true, numericality: { only_integer: true,  greater_than_or_equal_to: 0}
end
