# == Schema Information
#
# Table name: zip_codes
#
#  id         :integer          not null, primary key
#  zip_code   :integer          not null
#  city       :string(255)      not null
#  state_name :string(255)      not null
#  state_code :string(255)      not null
#  longitude  :float            not null
#  latitude   :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ZipCode < ActiveRecord::Base
  attr_accessible :zip_code, :city, :state_name, :state_code,
    :longitude, :latitude

  validates :zip_code, :city, :state_name, :state_code,
    :longitude, :latitude, presence: true

  validates :zip_code, uniqueness: true

end
