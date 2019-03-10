class Skill < ApplicationRecord
  validates_presence_of :title, :percent_utilized
  # We are not using the following...yet at least
  # after_initialize :set_defaults
  # # Call Placeholder module from concerns folder
  # include Placeholder

  # def set_defaults
  #   self.badge ||= Placeholder.image_generator(height: "250", width: "250")
  # end
end
