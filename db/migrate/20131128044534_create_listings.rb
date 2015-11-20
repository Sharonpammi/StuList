class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :producttype
      t.string :subcategory
      t.string :category
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
