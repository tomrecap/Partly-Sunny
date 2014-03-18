# spec/models/comment_spec.rb

require 'spec_helper'

describe Comment do

  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:photo_id) }
  it { should validate_presence_of(:user_id) }

  it { should belong_to(:photo) }
  it { should belong_to(:author).class_name("User").with_foreign_key(:user_id) }

end