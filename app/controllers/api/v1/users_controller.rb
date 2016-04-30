class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:me]

  api!
  description <<-EOS
  === Wymagana autentykacja
  === Success response - current user:
    {
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
  def me
    @user = current_user
    respond_with @user
  end

  api!
  description <<-EOS
  === Success response:
    "users": [
    {
      "id": 2,
      "first_name": null,
      "last_name": null,
      "nickname": null,
      "email": "test@onet.pl",
      "created_at": "2016-04-20T08:03:47.203Z",
      "phone_number": null,
      "address": null,
      "gender": null,
      "date_of_birth": null,
      "specialization": null
    },
    {
      "id": 3,
      "first_name": null,
      "last_name": null,
      "nickname": null,
      "email": "tes@onet.pl",
      "created_at": "2016-04-20T08:09:12.710Z",
      "phone_number": null,
      "address": null,
      "gender": null,
      "date_of_birth": null,
      "specialization": null
    }]
  EOS
  def index
    @users = User.all
    respond_with @users
  end

  api!
  param :id, :number
  description <<-EOS
  === Success response:
    "user": {
      "id": 2,
      "first_name": null,
      "last_name": null,
      "nickname": null,
      "email": "test@onet.pl",
      "created_at": "2016-04-20T08:03:47.203Z",
      "phone_number": null,
      "address": null,
      "gender": null,
      "date_of_birth": null,
      "specialization": null
    }
  EOS
  def show
    @user = User.find(params[:id])
    respond_with @user
  end
end