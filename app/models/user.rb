# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  # Magic. Requires :password and :password_confirmation, along
  # with 'password_digest' column in table.
  has_secure_password

  has_many :microposts, dependent: :destroy

  # So that database always has lowercase email (to ensure the
  # case-insensitive uniqueness enforced by the index works)
  before_save { |user| user.email = email.downcase }

  # Generate token
  before_save :create_remember_token

  VALID_EMAIL_REGEX = /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  def feed
    # This is preliminary. See "Following users" for the full implementation
    Micropost.where("user_id = ?", id)
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
