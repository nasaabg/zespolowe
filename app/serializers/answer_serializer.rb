class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :body, :is_accepted,
    :created_at, :question_id, :counter

  has_one :user
end
