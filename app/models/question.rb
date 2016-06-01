class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :question_points
  acts_as_taggable
  acts_as_commentable

  def add_point!(user_id)
    question_points.create(user_id: user_id)
  end

  def remove_point!(user_id)
    question_points.where(user_id: user_id).first.destroy
  end

  def can_add_point?(giver)
    giver != user && question_points.where(user_id: giver.id).empty?
  end

  def can_sub_point?(giver)
    giver != user && question_points.where(user_id: giver.id).any?
  end
end
