# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  body       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  attr_accessible :body

  validates :body, presence: true, uniqueness: true

  has_many :photo_taggings, dependent: :destroy
  has_many :photos, through: :photo_taggings, source: :photo
end
