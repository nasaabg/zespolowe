class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:me, :update]

  ActionController::Parameters.action_on_unpermitted_parameters = :raise

  rescue_from(ActionController::UnpermittedParameters) do |pme|
    render json: { error:  { unknown_parameters: pme.params } }, status: :bad_request
  end

  rescue_from(ActionController::ParameterMissing) do |pme|
    render json: { error: {param_is_missing:  pme.param } }, status: :bad_request
  end

  def me
    @user = current_user
    respond_with @user
  end

  def index
    @users = User.all
    respond_with @users
  end

  def show
    @user = User.find(params[:id])
    respond_with @user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: @user.errors }, status: 422
    end

  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :nickname,
      :phone_number,
      :address,
      :gender,
      :date_of_birth,
      :specialization
    )
  end
end