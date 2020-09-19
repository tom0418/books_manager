class ApplicationController < ActionController::Base
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?

  after_action :verify_authorized

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_users_path
    else
      user_path(resource)
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :admin, :department_id]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  end
end
