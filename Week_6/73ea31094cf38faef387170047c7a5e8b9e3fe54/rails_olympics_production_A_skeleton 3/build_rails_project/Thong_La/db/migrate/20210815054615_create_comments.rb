# `Comments` will have a `body` which is a string, and will belong to both a
#    `User` (name this column `author_id`). and a `Blog` (name this column
#    `blog_id`).

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body, null: false 
      t.integer :author_id, null: false 
      t.integer :blog_id, null: false
      t.timestamps
    end

    add_index :comments, :author_id
    add_index :comments, :blog_id 
  end
end
