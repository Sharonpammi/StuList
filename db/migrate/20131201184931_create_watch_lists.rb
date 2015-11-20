class CreateWatchLists < ActiveRecord::Migration
  def change
    create_table :watch_lists do |t|
      t.integer :user_id
      t.string :keyword

      t.timestamps
    end
    add_index :watch_lists, [:user_id, :created_at]
  end
end
