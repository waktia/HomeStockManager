class AddReferenceToItems < ActiveRecord::Migration[7.1]
  def change
    add_reference :items, :main_category, foreign_key: true
  end
end
