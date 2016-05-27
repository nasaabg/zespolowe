class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :body, :is_accepted,
    :created_at, :user_id, :question_id, :counter
end
