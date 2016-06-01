class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :tags, :created_at, :user_id, :points

  has_one :user

  def tags
    object.tag_list
  end

  def points
    object.question_points.count
  end
end
