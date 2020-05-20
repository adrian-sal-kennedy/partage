class ApplicationController < ActionController::Base
  # rescue_from CanCan::AccessDenied do |_exception|
  #   render file: Rails.root.join('public/403.html'), status: :forbidden
  # end
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Not authorized to perform that action"
    redirect_to resources_path
  end 
end
