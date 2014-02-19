# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  user_name           :string(255)      not null
#  email               :string(255)      not null
#  password_digest     :string(255)      not null
#  bio                 :string(140)
#  session_token       :string(255)      not null
#  activated           :boolean          default(FALSE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  home_city_id        :integer          not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class User < ActiveRecord::Base
  attr_accessible :user_name, :email, :password, :bio, :session_token,
    :home_city_id, :password_confirmation, :favorite_city_ids,
    :favorited_user_ids, :avatar
  attr_reader :password

  has_attached_file :avatar, styles: { thumbnail: "100x100", full: "600x600" }, :default_url => "images/avatar.png"

  before_validation :ensure_session_token
  validates :user_name, :email, :session_token, :home_city_id,
    :password_digest, presence: true
  validates :user_name, :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 8, allow_nil: true }
  validates_confirmation_of :password
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  belongs_to(:home_city, class_name: "City", foreign_key: :home_city_id,
    primary_key: :id)

  has_many(:favorite_city_links, class_name: "FavoriteCityLink",
    foreign_key: :user_id, primary_key: :id)
  has_many(:favorite_cities, through: :favorite_city_links, source: :city)

  has_many(:favorite_user_links_outbound, class_name: "FavoriteUserLink",
    foreign_key: :favoriter_id, primary_key: :id)
  has_many(:favorited_users, through: :favorite_user_links_outbound,
    source: :favorited_user)

  # MIGHT NOT NEED THESE?
  has_many(:favorite_user_links_inbound, class_name: "FavoriteUserLink",
    foreign_key: :favorited_id, primary_key: :id)
  has_many(:admirers, through: :favorite_user_links_inbound,
    source: :favoriter)

  has_many(:photos, class_name: "Photo", foreign_key: :submitter_id, primary_key: :id, dependent: :destroy)

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
