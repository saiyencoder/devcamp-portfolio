class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image
  # When Portfolio gets initialized, New Method, it will run the set_defaults method
  after_initialize :set_defaults
  # Call Placeholder module from concerns folder
  include Placeholder

  def self.angular
    where(subtitle: "Angular")
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails") }

  def set_defaults
    self.main_image  ||= Placeholder.image_generator(height: "600", width: "400")
    self.thumb_image ||= Placeholder.image_generator(height: "350", width: "200")
  end

end


# Explaination of ||=
# If the item is nil, it will run the code
# In other words, when creating a new portfolio, if no main image or thumb image is given,
# set_defaults will give it a default value
# Another way of looking at it is:
# if self.main_image == nil
#   self.main_image = "https://via.placeholder.com/600x400"
# end