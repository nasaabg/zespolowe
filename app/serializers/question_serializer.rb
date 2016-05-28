class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :tags, :created_at, :user_id, :counter

  has_one :user

  def tags
    object.tag_list
  end
end
