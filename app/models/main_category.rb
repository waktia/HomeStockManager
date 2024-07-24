class MainCategory < ApplicationRecord
  has_many :items
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50}
end
