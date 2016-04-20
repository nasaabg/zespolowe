class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    respond_with @users
  end

  def show
    @user = User.find(params[:id])
    respond_with @user
  end
end