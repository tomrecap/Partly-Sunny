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

require 'test_helper'

class FavoriteZipCodeLinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
