class CreateVoteTypes < ActiveRecord::Migration
  def change
    create_table :vote_types do |t|
      t.integer :type

      t.timestamps null: false
    end
  end
end
