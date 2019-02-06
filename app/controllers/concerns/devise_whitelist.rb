module DeviseWhitelist
  extend ActiveSupport::Concern

  # Run "configure_permitted_parameters" method if the devise controller is being called/used
  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end