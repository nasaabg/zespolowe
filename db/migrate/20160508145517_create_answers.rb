class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.boolean :is_accepted?, :default => false

      t.timestamps null: false
    end
  end
end
