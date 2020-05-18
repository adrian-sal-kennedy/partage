class ApplicationController < ActionController::Base
  # rescue_from CanCan::AccessDenied do |_exception|
  #   render file: Rails.root.join('public/403.html'), status: :forbidden
  # end
  rescue_from CanCan::AccessDenied do |exception|
    flash[:authorization_error] = "Not authorized to perform that action"
    redirect_to listings_path
  end 
end
