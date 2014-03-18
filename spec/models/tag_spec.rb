# spec/models/tag_spec.rb

require 'spec_helper'

describe Tag do

  it { should validate_presence_of(:body) }

  it { should validate_uniqueness_of(:body) }

  it { should have_many(:photo_taggings) }
  it { should have_many(:photos).through(:photo_taggings) }

end
