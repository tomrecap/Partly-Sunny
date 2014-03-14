# spec/models/user_spec.rb

require 'spec_helper'

describe User do
  it "should create a password digest when a password is given" do
    user = FactoryGirl.create(:user)

    expect(user.password_digest).to_not be_nil
  end

  it "should create a session token after initializing a user object" do
    user = FactoryGirl.create(:user)

    expect(user.session_token).to_not be_nil
  end

  it "should reset the session token when asked" do
    user = FactoryGirl.create(:user)
    old_session_token = user.session_token
    user.reset_session_token!

    expect(user.session_token).to_not eq(old_session_token)
  end

  it "should correctly verify a user's password" do
    user = FactoryGirl.create(:user, password: "password")

    expect(user.is_password?("password")).to be_true
  end

  it { should validate_presence_of(:user_name) }
  it { should validate_presence_of(:password_digest) }

  it { should ensure_length_of(:password).is_at_least(8) }
  it { should validate_confirmation_of(:password) }

  it { should belong_to(:home_zip_code) }

  it { should have_many(:favorite_zip_code_links) }
  it do
    should have_many(:favorite_zip_codes)
      .through(:favorite_zip_code_links)
  end

  it { should have_many(:favorite_user_links_outbound) }
  it do
    should have_many(:favorited_users)
      .through(:favorite_user_links_outbound)
  end

  it { should have_many(:photos) }
end