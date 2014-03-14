# spec/models/zip_code_spec.rb

require 'spec_helper'

describe ZipCode do

  it { should validate_presence_of(:zip_code) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state_name) }
  it { should validate_presence_of(:state_code) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:latitude) }

  it { should validate_uniqueness_of(:zip_code) }

end