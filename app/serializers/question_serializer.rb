class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :tags, :created_at, :user_id

  has_one :user
  has_many :answer

  def tags
    object.tag_list
  end
end
