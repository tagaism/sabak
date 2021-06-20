class User < ApplicationRecord
  extend FriendlyId
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable

  rolify
  has_many :courses

  validate :must_have_role, on: :update

  friendly_id :email, use: :slugged

  after_create :assign_default_role

  def to_s
    email
  end

  # def username
  #   email.split("@").first.downcase
  # end

  private
  
  def assign_default_role
    self.add_role :student if self.roles.blank?
  end
  
  def must_have_role
    errors.add(:roles, 'Must have at least one role.') if roles.empty?
  end
end
