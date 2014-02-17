# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string(255)      not null
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  bio             :string(140)      not null
#  session_token   :string(255)      not null
#  activated       :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  home_city_id    :integer          not null
#

class User < ActiveRecord::Base
  attr_accessible :user_name, :email, :password, :bio, :session_token, :home_city_id, :password_confirmation
  attr_reader :password

  before_validation :ensure_session_token
  validates :user_name, :email, :bio, :session_token, :home_city_id, :password_digest, presence: true
  validates :user_name, :session_token, uniqueness: true
  validates :password, length: { minimum: 8, allow_nil: true }
  validates_confirmation_of :password

  def self.find_by_credentials(user_name, entered_password)
    user = User.find_by_user_name(user_name)
    user.try(:is_password?, entered_password) ? user : nil
  end

  def self.new_token
    SecureRandom::urlsafe_base64(16)
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def is_password?(guess)
    BCrypt::Password.new(self.password_digest).is_password?(guess)
  end

  def reset_session_token!
    self.session_token = self.class.new_token
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.new_token
  end
end
