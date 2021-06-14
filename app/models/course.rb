class Course < ApplicationRecord
  extend FriendlyId
  include PublicActivity::Model

  friendly_id :title, use: :slugged

  validates :title, :description, :short_description, :language, :price, :level, presence: true
  
  belongs_to :user
  
  has_rich_text :description

  LANGUAGES = ["English", "Japanese", "Kyrgyz"]
  def self.languages
    LANGUAGES.map{ |l| [l, l] }
  end

  LEVELS = ["Beginner", "Intermediate", "Advanced"]
  def self.levels
    LEVELS.map{ |l| [l, l] }
  end
  
  # activities
  tracked owner: Proc.new { |controller, model| controller.current_user }
end
