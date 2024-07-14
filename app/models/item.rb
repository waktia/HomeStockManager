class Item < ApplicationRecord
  belongs_to :user
  belongs_to :main_category, optional: true
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50}
  validates :stock, presence: true, numericality: true
  validates :days, presence: true, numericality: { only_integer: true,  greater_than_or_equal_to: 0}

  def self.update_all_stocks
    all.each do |item|
      item.update_stock
      item.save
    end
  end

  def update_stock
    diff_stock = (100.0/self.days).round(1)
    self.stock = self.stock - diff_stock
    self.stock = 0 if self.stock < 0
  end
end
