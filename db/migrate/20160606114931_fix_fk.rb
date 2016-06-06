class FixFk < ActiveRecord::Migration
    remove_foreign_key :answer_points, :answers
    remove_foreign_key :answer_points, :users
    remove_foreign_key :answers, :users
    remove_foreign_key :question_points, :users
    remove_foreign_key :questions, :users
    add_foreign_key :answer_points, :answers, on_delete: :cascade
    add_foreign_key :answer_points, :users, on_delete: :cascade
    add_foreign_key :answers, :users, on_delete: :cascade
    add_foreign_key :question_points, :users, on_delete: :cascade
    add_foreign_key :questions, :users, on_delete: :cascade
end
