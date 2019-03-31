class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout
  
    protected
    
      def configure_permitted_parameters
           devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fname, :lname, :ssn, :bdate, :department_id, :email, :password)}
    
           devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:fname, :lname, :ssn, :bdate, :department_id, :email, :password, :current_password)}
      end
      
    private  
      def layout
          # only turn it off for login pages:
          is_a?(Devise::SessionsController) ? false : "application"
          # or turn layout off for every devise controller:
          !devise_controller? && "application"
      end
end
