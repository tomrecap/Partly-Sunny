# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  user_name           :string(255)      not null
#  email               :string(255)      not null
#  password_digest     :string(255)      not null
#  bio                 :string(140)
#  session_token       :string(255)      not null
#  activated           :boolean          default(FALSE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  home_city_id        :integer          not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
