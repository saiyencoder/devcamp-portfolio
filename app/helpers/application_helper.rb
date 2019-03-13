module ApplicationHelper
  # Since this is a ruby method, we have to add 
  # "html_safe" for it to get processed
  # def sample_helper
  #   "<p>My helper</p>".html_safe
  # end
  # The above code can be written the following way:
  # def sample_helper
  #   content_tag(:p, "My helper", class: "I am the superior class")
  # end

  # Login helper requires an argument passed in.
  # by having " = '' " we set the default to be an empty string.
  # If a class is passed in, the argument will take effect
  def login_helper style = ''
    if current_user.is_a?(GuestUser) 
      (link_to "Register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style )
    else 
      link_to "Logout", destroy_user_session_path, method: :delete, class: style 
    end
  end

  def source_helper
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  # This is calling the module in the ruby gem we created
  def copyright_generator
    # Module::Class.method arguments
    BarneysViewTool::Renderer.copyright 'Barney Stinson', 'Challenge Accepted!'
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_path,
        title: 'About Me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blogs'
      },
      {
        url: portfolios_path,
        title: 'Portfolios'
      },
    ]
  end

  def nav_helper style, tag_type
  nav_links = ' '
  
  nav_items.each do |item|
  nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
  end

  nav_links.html_safe
  end

  # Return "active" if the current page (Rails method) matches
  # whatever "path" we passed in
  def active? path
    "active" if current_page? path
  end
 
  def alerts
    alert = ( flash[:alert] || flash[:notice] || flash[:error] )

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Barney's Bro Box", sticky: false)
  end

end

# Here Doc:
# It is used for multi-line strings. It starts with <<WHATEVERNAMEIANT
# I can type all the strings I want and make sure I close it out with
# WHATEVERNAMEIANT at the end

# Rule of thumb on when to use html_safe:
# If you are going to deal with user input,
# then its best not to use it. If we put our own
# content then it should be fine

# When to use a view helper and when to use a partial:
# If the logic that we are trying to implement in the 
# view is conditinals (If..else, case, etc) then we use a view helper.
# If we are implementing something like a nav bar (links or html code)
# then we can use a partial 
