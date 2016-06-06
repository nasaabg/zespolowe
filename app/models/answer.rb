class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question, :dependent => :destroy
  has_many :answer_points
  acts_as_commentable

  def accept!
    update(is_accepted: true)
  end

  def add_point!(user_id)
    answer_points.create(user_id: user_id)
  end

  def remove_point!(user_id)
    answer_points.where(user_id: user_id).first.destroy
  end

  def can_add_point?(giver)
    giver != user && answer_points.where(user_id: giver.id).empty?
  end

  def can_sub_point?(giver)
    giver != user && answer_points.where(user_id: giver.id).any?
  end
end
