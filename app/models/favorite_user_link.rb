# == Schema Information
#
# Table name: favorite_user_links
#
#  id           :integer          not null, primary key
#  favoriter_id :integer          not null
#  favorited_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class FavoriteUserLink < ActiveRecord::Base
  attr_accessible :favoriter_id, :favorited_id

  validates :favoriter_id, :favorited_id, presence: true
  validates :favoriter_id, uniqueness: { scope: :favorited_id }

  belongs_to(
    :favorited_user,
    class_name: "User",
    foreign_key: :favorited_id,
    primary_key: :id
  )

  belongs_to(
    :favoriter,
    class_name: "User",
    foreign_key: :favoriter_id,
    primary_key: :id
  )
end
