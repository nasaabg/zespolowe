class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  acts_as_taggable

  def add_point!
    update(counter: counter+1)
  end

  def remove_point!
    update(counter: counter-1)
  end
end
