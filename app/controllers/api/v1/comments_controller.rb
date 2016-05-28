class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_commentable

  api!
  def index
    comments = @commentable.comments
    respond_with comments
  end

  api!
  def show
    comment = @commentable.comments.find(params[:id])
    respond_with comment
  end

  api!
  description <<-EOS
  === Wymagana autentykacja
  === Success response:
    {
      "id": 4,
      "title": "",
      "comment": "My new comment",
      "commentable_id": 9,
      "commentable_type": "Question",
      "user_id": null,
      "role": "comments",
      "created_at": "2016-05-28T10:38:51.672Z",
      "updated_at": "2016-05-28T10:38:51.672Z"
    }
  EOS
  example <<-EOS
  Example json to create Question
  {
    "comment":{
        "comment": "My new comment"
    }
  }
  EOS
  def create
    comment = @commentable.comments.new(comment_params)
    comment.user = current_user
    if comment.save
      render json: comment, status: 201
    else
      render json: { errors: question.errors }, status: 422
    end
  end

  private

  def set_commentable
    @commentable = if params[:answer_id]
      Answer.find(params[:answer_id])
    else
      Question.find(params[:question_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
