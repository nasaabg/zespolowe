class Api::V1::AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :accept]
  before_filter :get_question

   api!
  description <<-EOS
  === Success response:
  {
    "answers": [
      {
        "id": 1,
        "body": "The best answer",
        "is_accepted": false,
        "created_at": "2016-05-27T07:43:42.092Z",
        "user_id": 2,
        "question_id": 9
      },
      {
        "id": 2,
        "body": "Bad answer",
        "is_accepted": false,
        "created_at": "2016-05-27T08:24:26.316Z",
        "user_id": 10,
        "question_id": 9
      }
    ]
  }
  EOS
  example <<-EOS
  GET api/questions/1/answers
  EOS
  def index
    @answers = @question.answers
    respond_with @answers
  end

  api!
  description <<-EOS
  === Success response:
   {
    "answer": {
      "id": 1,
      "body": "adasassadssa",
      "is_accepted": false,
      "created_at": "2016-05-27T07:43:42.092Z",
      "user_id": 2,
      "question_id": 9
    }
   }
  EOS
  example <<-EOS
  GET api/questions/9/answers/1
  EOS
  def show
    @answer = @question.answers.find(params[:id])
    respond_with @answer
  end

  api!
  param :body, String
  description <<-EOS
  === Wymagana autentykacja
  === Success response:
  {
    "answer": {
      "id": 3,
      "body": "This is my answer",
      "is_accepted": null,
      "created_at": "2016-05-27T08:36:53.071Z",
      "user_id": 10,
      "question_id": 9
    }
  }
  EOS
  example <<-EOS
  Example json to create Question
  {
    "answer":{
        "body": "This is my answer"
    }
  }
  EOS
  def create
    answer = current_user.answers.build(answer_params)
    answer.question = @question

    if answer.save
      render json: answer, status: 201
    else
      render json: { errors: answer.errors }, status: 422
    end
  end

  api :PUT, '/questions/:question_id/answers/:id'
  param :body, String, required: false
  description <<-EOS
  === Wymagana autentykacja
  === Success response
   {
    "answer": {
      "id": 3,
      "body": "My edited answer",
      "is_accepted": null,
      "created_at": "2016-05-27T08:36:53.071Z",
      "user_id": 10,
      "question_id": 9
    }
  }
  EOS
  example <<-EOS
  Example json to update Question
  {
    "answer":{
        "body": "My edited answer"
    }
  }
  EOS
  def update
    current_user = User.last
    answer = current_user.answers.find(params[:id])
    if answer.update(answer_params)
      render json: answer, status: 200
    else
      render json: { errors: answer.errors }, status: 422
    end
  end

  api!
  def accept
    render json: {}, status: 401 and return if current_user != @question.user

    answer = Answer.find(params[:id])
    if answer.accept!
      render json: answer, status: 200
    else
      render json: { errors: answer.errors }, status: 422
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def get_question
    @question = Question.find(params[:question_id])
  end
end
