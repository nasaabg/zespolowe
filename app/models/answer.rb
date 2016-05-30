class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :answer_points
  acts_as_commentable

  def accept!
    update(is_accepted: true)
  end

  def add_point!(user_id)
    answer_points.create(user_id: user_id)
  end

  def remove_point!(giver_id)
    answer_points.create(user_id: giver_id, addition: false)
  end

  def points
    additions = answer_points.where(addition: true).count
    subtractions = answer_points.where(addition: false).count
    additions - subtractions
  end

  def can_add_point?(giver)
    giver != user && answer_points.where(user_id: giver.id, addition: true).empty?
  end

  def can_sub_point?(giver)
    giver != user && answer_points.where(user_id: giver.id, addition: false).empty?
  end
end
