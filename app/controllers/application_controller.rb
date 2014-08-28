class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # This helper is needed to correctly redirect in case of failure, because User is not database_authenticatable
  def new_session_path(scope)
    new_user_session_path
  end
end
