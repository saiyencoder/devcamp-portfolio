class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Will not allow a blog post to be created unless a title and body is present
  validates_presence_of :title, :body

  # Blog belongs to topic
  # Added optional: true for section 10 lecture 113 because it would not 
  # let me created a new blog without adding a topic to it
  belongs_to :topic, optional: true
end
