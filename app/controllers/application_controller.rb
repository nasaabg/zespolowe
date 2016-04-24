class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json

  protected

  def configure_permitted_parameters
    keys = [:last_name, :first_name, :gender, :address, :specialization, :phone_number, :date_of_birth]
    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
  end
end
