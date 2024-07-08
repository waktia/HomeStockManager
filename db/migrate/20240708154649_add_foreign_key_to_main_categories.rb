class AddForeignKeyToMainCategories < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :main_categories, :users
    add_index :main_categories, :user_id
  end
end
