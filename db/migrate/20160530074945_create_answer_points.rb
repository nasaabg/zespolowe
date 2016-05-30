class CreateAnswerPoints < ActiveRecord::Migration
  def change
    create_table :answer_points do |t|
      t.references :user, index: true, foreign_key: true
      t.references :answer, index: true, foreign_key: true
      t.boolean :addition, default: true

      t.timestamps null: false
    end
  end
end
