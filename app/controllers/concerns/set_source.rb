module SetSource
  extend ActiveSupport::Concern

  included do 
    before_action :set_source
  end

  def set_source
    session[:source] = params[:q] if params[:q]
  end

end

=begin
  Set source grabs the parameter "q" from the link:
  EX. localhost:3000/portfolio/1?q=Facebook;
  and stores it in our sessions source key
=end
