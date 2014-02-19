# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :string(255)      not null
#  photo_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :body, :photo_id, :user_id

  validates :body, :photo_id, :user_id, presence: true

  belongs_to :photo
  belongs_to :author, class_name: "User", foreign_key: :user_id

end
