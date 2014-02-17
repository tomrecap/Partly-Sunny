# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string(255)      not null
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  bio             :string(140)      not null
#  session_token   :string(255)      not null
#  activated       :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  home_city_id    :integer          not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
