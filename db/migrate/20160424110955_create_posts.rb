class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :post_type, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true, null: true
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
