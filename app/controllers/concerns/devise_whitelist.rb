module DeviseWhitelist
  extend ActiveSupport::Concern

  # Run "configure_permitted_parameters" method if the devise controller is being called/used
  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    # This will allow the sign_up and account_update page to be permitted 
    # to create/change the name attribute
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end

=begin
  Since we don not have access to the devise controller,we have to create a 
  concern to whitelist the "name" attribute from the user model.

  **Note**
  Naming convention for creating the ruby file:
  module IAmARubyFile -> should be named as -> i_am_a_ruby_file.rb
=end