class AddCounterToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :counter, :integer, default: 0
  end
end
