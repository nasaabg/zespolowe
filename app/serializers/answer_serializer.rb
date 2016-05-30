class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :body, :is_accepted,
    :created_at, :question_id, :points

  has_one :user

  def points
    object.points
  end
end
