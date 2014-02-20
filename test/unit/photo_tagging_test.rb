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

require 'test_helper'

class PhotoTaggingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
