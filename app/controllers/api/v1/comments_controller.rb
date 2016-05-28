class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_commentable

  def index
    comments = @commentable.comments
    respond_with comments
  end

  def show
    comment = @commentable.comments.find(params[:id])
    respond_with comment
  end

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
