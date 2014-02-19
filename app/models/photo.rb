# == Schema Information
#
# Table name: photos
#
#  id                 :integer          not null, primary key
#  caption            :string(255)
#  submitter_id       :integer          not null
#  city_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Photo < ActiveRecord::Base
  attr_accessible :caption, :submitter_id, :city_id , :image, :tag_ids

  has_attached_file :image, styles: {
    big: "1200x1200>",
    small: "200x200>"
  }

  validates :submitter_id, :city_id, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :city
  belongs_to :submitter, class_name: "User", foreign_key: :submitter_id

  has_many :comments, dependent: :destroy
  has_many :photo_taggings, dependent: :destroy
  has_many :tags, through: :photo_taggings, source: :tag

end
