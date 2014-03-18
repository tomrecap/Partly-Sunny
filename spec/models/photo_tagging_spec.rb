# spec/models/photo_tagging_spec.rb

require 'spec_helper'

describe PhotoTagging do

  it { should validate_presence_of(:photo_id) }
  it { should validate_presence_of(:tag_id) }

  it do
    FactoryGirl.create(:photo_tagging)
    should validate_uniqueness_of(:photo_id).scoped_to(:tag_id)
  end

  it { should belong_to(:photo) }
  it { should belong_to(:tag) }

end