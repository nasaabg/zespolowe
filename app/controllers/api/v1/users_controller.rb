class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:me]

  def me
    @user = current_user
    respond_with @user
  end

  def index
    @users = User.all
    respond_with @users
  end

  api :GET, '/users/:id'
  param :id, :number
  def show
    @user = User.find(params[:id])
    respond_with @user
  end
end