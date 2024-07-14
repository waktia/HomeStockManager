class ChangeDataStockToItem < ActiveRecord::Migration[7.1]
  def up
    change_column :items, :stock, :float
  end
end
