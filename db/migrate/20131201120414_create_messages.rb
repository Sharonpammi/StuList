class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :FromUserId
      t.integer :user_id
      t.string :SubjectTitle
      t.string :Body

      t.timestamps
    end
  end
end
