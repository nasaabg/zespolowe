class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  acts_as_commentable

  def accept!
    update(is_accepted: true)
  end

  def add_point!
    update(counter: counter+1)
  end

  def remove_point!
    update(counter: counter-1)
  end
end
