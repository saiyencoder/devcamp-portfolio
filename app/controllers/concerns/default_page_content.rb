module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    # Displays the title of the page, name on the tab of webpage
    @page_title = "DevcampPortfolio | Jesus Portfolio" 
    @seo_keywords = "Jesus Santizo portfolio" 
  end

end