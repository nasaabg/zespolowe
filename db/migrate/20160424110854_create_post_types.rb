class CreatePostTypes < ActiveRecord::Migration
  def change
    create_table :post_types do |t|
      t.integer :type

      t.timestamps null: false
    end
  end
end
