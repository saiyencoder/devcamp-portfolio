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
    # Due to the petergate gem, OpenStruct is not able to use their methods.
    # OpenStruct.new(name: "Guest User", 
    #                first_name: "Guest", 
    #                last_name: "User", 
    #                email: "guest@example.com"
    #                )
    # Luckily we can just create a GuestUser model that inherits from the User model.
    # Now we can create a guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest
  end

end