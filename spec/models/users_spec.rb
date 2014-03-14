# spec/models/user_spec.rb

require 'spec_helper'

describe User do
  it "should create a password digest when a password is given" do
    user = FactoryGirl.create(:user)

    expect(user.password_digest).to_not be_nil
  end
end