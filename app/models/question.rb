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
    question_points.create(user_id: user_id, addition: false)
  end

  def points
    additions = question_points.where(addition: true).count
    subtractions = question_points.where(addition: false).count
    additions - subtractions
  end

  def can_add_point?(giver)
    giver != user && question_points.where(user_id: giver.id, addition: true).empty?
  end

  def can_sub_point?(giver)
    giver != user && question_points.where(user_id: giver.id, addition: false).empty?
  end
end
