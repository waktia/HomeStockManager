class Item < ApplicationRecord
  belongs_to :user
  belongs_to :main_category
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50}
end
