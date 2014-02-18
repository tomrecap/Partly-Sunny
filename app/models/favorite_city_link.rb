# == Schema Information
#
# Table name: favorite_city_links
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  city_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FavoriteCityLink < ActiveRecord::Base
  attr_accessible :user_id, :city_id

  validates :user_id, :city_id, presence: true
  validates :user_id, uniqueness: { scope: :city_id }

  belongs_to(
    :city,
    class_name: "City",
    foreign_key: :city_id,
    primary_key: :id
  )

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
end
