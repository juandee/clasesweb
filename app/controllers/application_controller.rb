class ApplicationController < ActionController::Base
	protect_from_forgery prepend: true
	before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :dni, :birthday, :email])
            update_attrs = [:password, :password_confirmation, :current_password]
    		devise_parameter_sanitizer.permit :account_update, keys: update_attrs
        end
end
