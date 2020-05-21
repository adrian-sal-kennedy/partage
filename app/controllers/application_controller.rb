class ApplicationController < ActionController::Base
  # rescue_from CanCan::AccessDenied do |_exception|
  #   render file: Rails.root.join('public/403.html'), status: :forbidden
  # end
  rescue_from CanCan::AccessDenied do |exception|
    pp flash[:alert] = exception.message
    redirect_to user_resources_path(current_user.id)
  end 
end
