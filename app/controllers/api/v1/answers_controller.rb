class Api::V1::AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]

  api!
  description <<-EOS
  === Success response:
    "questions": [
    {
      "id": 1,
      "title": "dsasasdsa",
      "description": "Question is a question",
      "tags": ["awesome", "good"],
      "created_at": "2016-04-30T10:47:34.199Z",
      "user_id": 10,
      "user": {
        "id": 10,
        "first_name": "sssss",
        "last_name": "bolo",
        "nickname": null,
        "email": "test8@onet.pl",
        "created_at": "2016-04-25T15:23:04.787Z",
        "phone_number": "12397213798729",
        "address": null,
        "gender": null,
        "date_of_birth": null,
        "specialization": null
      }
    },
    {
      "id": 2,
      "title": "titile 2",
      "description": "How to fix Java bugs",
      "tags": ["ruby", "skills"],
      "created_at": "2016-04-30T10:47:48.859Z",
      "user_id": 10,
      "user": {
        "id": 10,
        "first_name": "sssss",
        "last_name": "bolo",
        "nickname": null,
        "email": "test8@onet.pl",
        "created_at": "2016-04-25T15:23:04.787Z",
        "phone_number": "12397213798729",
        "address": null,
        "gender": null,
        "date_of_birth": null,
        "specialization": null
      }
    }
    ]
  EOS
  example <<-EOS
  GET api/answers
  EOS
  def index
    @answers = Answer.all
    respond_with @answers
  end

  api :GET, '/questions/:id/answers'
  description <<-EOS
  === Success response:
    {
      "id": 6,
      "title": "dsasasdsa",
      "description": "This is my question!",
      "tags": ["awesome", "good"],
      "created_at": "2016-04-30T10:47:34.199Z",
      "user_id": 10
      "user": {
        "id": 10,
        "first_name": "sssss",
        "last_name": "bolo",
        "nickname": null,
        "email": "test8@onet.pl",
        "created_at": "2016-04-25T15:23:04.787Z",
        "phone_number": "12397213798729",
        "address": null,
        "gender": null,
        "date_of_birth": null,
        "specialization": null
      }
    }
  EOS
  example <<-EOS
  GET api/questions/6/answers
  EOS
  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question: @question)
    respond_with @answers
  end

  api!
  param :title, String
  param :description, String
  param :tag_list, Array, of: String

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
  param :title, String, required: false
  param :description, String, required: false
  param :tag_list, Array, of: String, required: false
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

  api!
  example <<-EOS
  Example request: 
  GET /api/questions/taggable?tags=awesome,ruby
  EOS
  description <<-EOS
  === Success response 
    {
      "questions": [
          {
            "id": 1,
            "title": "dsasasdsa",
            "description": "My question?",
            "tags": [
              "ruby",
              "iphone"
            ],
            "created_at": "2016-04-30T10:47:34.199Z",
            "user_id": 10,
              "user": {
                "id": 10,
                "first_name": "sssss",
                "last_name": "bolo",
                "nickname": null,
                "email": "test8@onet.pl",
                "created_at": "2016-04-25T15:23:04.787Z",
                "phone_number": "12397213798729",
                "address": null,
                "gender": null,
                "date_of_birth": null,
                "specialization": null
              }
          },
          {
            "id": 7,
            "title": "tags",
            "description": "This is it...",
            "tags": [
              "c++",
              "java",
              "badass",
              "skills",
              "ruby",
              "awesome"
            ],
            "created_at": "2016-05-01T10:02:28.813Z",
            "user_id": 10,
            "user": {
              "id": 10,
              "first_name": "sssss",
              "last_name": "bolo",
              "nickname": null,
              "email": "test8@onet.pl",
              "created_at": "2016-04-25T15:23:04.787Z",
              "phone_number": "12397213798729",
              "address": null,
              "gender": null,
              "date_of_birth": null,
              "specialization": null
            }
          }
        ]
      }
  EOS

  private

  def question_params
    params.require(:question).permit(:title, :description, tag_list: [])
  end
end
