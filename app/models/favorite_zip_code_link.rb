# == Schema Information
#
# Table name: favorite_zip_code_links
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  zip_code_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class FavoriteZipCodeLink < ActiveRecord::Base
  attr_accessible :user_id, :city_id

  validates :user_id, :zip_code_id, presence: true
  validates :user_id, uniqueness: { scope: :zip_code_id }

  belongs_to(
    :zip_code,
    class_name: "ZipCode",
    foreign_key: :zip_code_id,
    primary_key: :id
  )

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
end
