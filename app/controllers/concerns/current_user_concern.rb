module CurrentUserConcern
  extend ActiveSupport::Concern

  # We are going to override the current_user method
  # Currently only the devise controller has access to the method
  def current_user
    # If a user is logged in, treat it normal (super: parent method)
    # else run code left of the double bar
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Guest User", 
                   first_name: "Guest", 
                   last_name: "User", 
                   email: "guest@example.com"
                   )
  end

end