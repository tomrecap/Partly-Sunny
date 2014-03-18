# spec/models/favorite_zip_code_link_spec.rb

require 'spec_helper'

describe FavoriteZipCodeLink do

  it { should validate_presence_of(:zip_code_id) }
  it { should validate_presence_of(:user_id) }

  it do
    FactoryGirl.create(:favorite_zip_code_link)
    should validate_uniqueness_of(:user_id).scoped_to(:zip_code_id)
  end

  it { should belong_to(:zip_code) }
  it { should belong_to(:user) }

end