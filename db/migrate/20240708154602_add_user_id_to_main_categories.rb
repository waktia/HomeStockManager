class AddUserIdToMainCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :main_categories, :user_id, :integer, null: false
  end
end
