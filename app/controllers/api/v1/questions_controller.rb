class Api::V1::QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]
  
  api!
  description <<-EOS
  === Success response:
    "questions": [
    {
      "id": 1,
      "title": "dsasasdsa",
      "description": "saassasaasasadasasddsaadsasdsdadssadsaasassda",
      "tags": ["awesome", "good"],
      "created_at": "2016-04-30T10:47:34.199Z",
      "user_id": 10
    },
    {
      "id": 2,
      "title": "titile 2",
      "description": "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz",
      "tags": ["ruby", "skills"],
      "created_at": "2016-04-30T10:47:48.859Z",
      "user_id": 10
    }
    ]
  EOS
  def index
    @questions = Question.all
    respond_with @questions
  end

  api!
  description <<-EOS
  === Success response:
    {
      "id": 1,
      "title": "dsasasdsa",
      "description": "saassasaasasadasasddsaadsasdsdadssadsaasassda",
      "tags": ["awesome", "good"],
      "created_at": "2016-04-30T10:47:34.199Z",
      "user_id": 10
    }
  EOS
  def show
    @question = Question.find(params[:id])
    respond_with @question
  end

  api!
  param :title, String
  param :description, String
  param :tag_list, Array
  description <<-EOS
  === Wymagana autentykacja
  === Success response:
    {
      "id": 5,
      "title": "title1",
      "description": "This is my question",
      "tags": ["awesome", "good"],
      "created_at": "2016-04-30T11:02:16.706Z",
      "user_id": 10
    }
  EOS
  example <<-EOS
  Example json to create Question
  {
    "question":{
        "title": "title9",
        "description": "This is my question1",
        "tag_list": ["ios", "java"]
    }
  }
  EOS
  def create
    question = current_user.questions.build(question_params)

    if question.save
      render json: question, status: 201
    else
      render json: { errors: question.errors }, status: 422
    end
  end

  api :PUT, '/questions/:id'
  param :id, :number, required: true
  param :title, String, required: false
  param :description, String, required: false
  param :tag_list, Array, required: false
  description <<-EOS
  === Wymagana autentykacja
  === Success response 
    {
      "id": 5,
      "title": "title4",
      "description": "This is my question",
      "tags": ["awesome", "good"],
      "created_at": "2016-04-30T11:02:16.706Z",
      "user_id": 10
    }
  EOS
  example <<-EOS
  Example json to update Question   
  {
    "question":{
        "title": "title9",
        "tag_list": ["ios", "java"]
    }
  }
  EOS
  def update
    question = current_user.questions.find(params[:id])
    if question.update(question_params)
      render json: question, status: 200, location: [:api, question]
    else
      render json: { errors: question.errors }, status: 422
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, tag_list: [])
  end
end
