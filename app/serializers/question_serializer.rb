class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :tags, :created_at, :user_id

  def tags
    object.tag_list
  end
end