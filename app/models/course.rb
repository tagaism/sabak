class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :description, presence: true
  
  belongs_to :user
  
  has_rich_text :description
end
