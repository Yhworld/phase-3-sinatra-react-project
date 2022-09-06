class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :caption
      t.integer :likes
      t.datetime :created_at
      t.datetime :updated_at
  end
end
