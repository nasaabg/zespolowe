class Api::V1::AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]
  before_filter :get_question

   def index
     @answers = @question.answers
     respond_with @answers
   end

   private

   def get_question
     @question = Question.find(params[:question_id])
   end
end
