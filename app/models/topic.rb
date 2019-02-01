class Topic < ApplicationRecord
  validates_presence_of :title

  # Topic has many blogs
  has_many :blogs
end
