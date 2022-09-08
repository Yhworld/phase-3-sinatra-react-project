class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :location
      t.string :image
      t.string :caption
      t.integer :likes
      t.integer :comments
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
