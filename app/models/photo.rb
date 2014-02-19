# == Schema Information
#
# Table name: photos
#
#  id                 :integer          not null, primary key
#  caption            :string(255)
#  submitter_id       :string(255)      not null
#  city_id            :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Photo < ActiveRecord::Base
  attr_accessible :caption, :submitter_id, :city_id , :image

  has_attached_file :image, styles: {
    big: "1200x1200>",
    small: "200x200>"
  }

  validates :submitter_id, :city_id, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to(:city, class_name: "City",
    foreign_key: :city_id, primary_key: :id)

  belongs_to(:submitter, class_name: "User",
    foreign_key: :submitter_id, primary_key: :id)

end
