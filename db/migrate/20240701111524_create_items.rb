class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :stock
      t.integer :days
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
