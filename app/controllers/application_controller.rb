class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_account

    def set_account
        @account = Account.find_by(subdomain: request.subdomain)
    end


    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, account_attributes: [:subdomain]])
    end


end
