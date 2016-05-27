class AddCounterToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :counter, :integer, default: 0
  end
end
