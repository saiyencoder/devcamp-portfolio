module ApplicationHelper
  # Since this is a ruby method, we have to add 
  # "html_safe" for it to get processed
  # def sample_helper
  #   "<p>My helper</p>".html_safe
  # end

  def login_helper
    if current_user.is_a?(User) 
      link_to "Logout", destroy_user_session_path, method: :delete 
    else 
      (link_to "Register", new_user_registration_path) +
      "<br>".html_safe +
      (link_to "Login", new_user_session_path )
    end
  end


end


# Rule of thumb on when to use html_safe:
# If you are going to deal with user input,
# then its best not to use it. If we put our own
# content then it should be fine

# When to use a view helper and when to use a partial:
# If the logic that we are trying to implement in the 
# view is conditinals (If..else, case, etc) then we use a view helper.
# If we are implementing something like a nav bar (links or html code)
# then we can use a partial 
