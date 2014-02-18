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

require 'test_helper'

class FavoriteUserLinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
