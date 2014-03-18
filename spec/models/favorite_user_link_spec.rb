# spec/models/favorite_user_link_spec.rb

require 'spec_helper'

describe FavoriteUserLink do

  it { should validate_presence_of(:favoriter_id) }
  it { should validate_presence_of(:favorited_id) }

  it do
    FactoryGirl.create(:favorite_user_link)
    should validate_uniqueness_of(:favoriter_id).scoped_to(:favorited_id)
  end

  it do
    should belong_to(:favorited_user)
      .class_name("User")
      .with_foreign_key(:favorited_id)
  end
  it do
    should belong_to(:favoriter)
      .class_name("User")
      .with_foreign_key(:favoriter_id)
  end

end
