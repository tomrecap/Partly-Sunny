# spec/models/photo_spec.rb

require 'spec_helper'

describe Photo do

  it { should validate_presence_of(:submitter_id) }
  it { should validate_presence_of(:zip_code_id) }


  it { should belong_to(:zip_code) }
  it do
    should belong_to(:submitter)
      .class_name("User")
      .with_foreign_key(:submitter_id)
  end

  it { should have_attached_file(:image) }

  it { should have_many(:comments) }
  it { should have_many(:photo_taggings) }
  it { should have_many(:tags).through(:photo_taggings) }

end
