class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    respond_with @users
  end
end