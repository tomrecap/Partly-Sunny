# == Schema Information
#
# Table name: photo_taggings
#
#  id         :integer          not null, primary key
#  photo_id   :integer          not null
#  tag_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PhotoTagging < ActiveRecord::Base
  attr_accessible :photo_id, :tag_id

  validates :photo_id, :tag_id, presence: true
  validates :photo_id, uniqueness: { scope: :tag_id }

  belongs_to :photo
  belongs_to :tag
end
