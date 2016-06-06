class UpdateFk < ActiveRecord::Migration
   def change
    remove_foreign_key :answers, :questions
    remove_foreign_key :question_points, :questions

    # add the new foreign_key
    add_foreign_key :answers, :questions, on_delete: :cascade
    add_foreign_key :question_points, :questions, on_delete: :cascade
  end
end
