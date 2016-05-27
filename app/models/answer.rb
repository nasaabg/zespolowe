class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  def accept!
    update(is_accepted: true)
  end
end
