class ChangeDataStockToItem < ActiveRecord::Migration[7.1]
  def change
    change_column :items, :stock, :integer
  end
end
