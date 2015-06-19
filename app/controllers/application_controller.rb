class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    case current_user.role
      when 'admin'
        users_path
      when 'user'
        content_premium_path
      else
        root_path
    end
  end

end
