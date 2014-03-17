# spec/models/zip_code_spec.rb

require 'spec_helper'

describe ZipCode do

  it { should validate_presence_of(:zip_code) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state_name) }
  it { should validate_presence_of(:state_code) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:latitude) }

  it do
    FactoryGirl.create(:zip_code)
    should validate_uniqueness_of(:zip_code)
  end
  
  context "nearby_zip_codes" do
    zip_codes = [
      "11110",
      "11111",
      "11112",
      "11113",
      "11114",
      "11115"]
    coords = [100, 100]
    zip_code_objects = []
    
    zip_codes.each do |zip_code_value|
      zip_code_objects << FactoryGirl.create(
        :zip_code,
        zip_code: zip_code_value,
        latitude: coords.first,
        longitude: coords.last
      )
      coords.map! { |coord| coord + 0.09 }      
    end
    
    it "should find zip codes within 0.2 degrees of lat & long" do
      nearby_zip_code_objects = zip_code_objects
        .first.nearby_zip_codes
      nearby_zip_codes = nearby_zip_code_objects.map do |z_c|
        z_c.zip_code
      end
      
      expect(nearby_zip_codes).to include("11110")
      expect(nearby_zip_codes).to include("11111", "11112")
      expect(nearby_zip_codes).to_not include("11113", "11114", "11115")
    end
  end
end