class Course < ApplicationRecord
  validates :title, :description, presence: true
  
  belongs_to :user
  
  has_rich_text :description
end
