class PhotoTagging < ActiveRecord::Base
  attr_accessible :photo_id, :tag_id

  validates :photo_id, :tag_id, presence: true
  validates :photo_id, uniqueness: { scope: :tag_id }

  belongs_to :photo
  belongs_to :tag
end
