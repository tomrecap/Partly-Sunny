# spec/models/zip_code_spec.rb

require 'spec_helper'

describe ZipCode do
  it "orders by city" do
    cavs = BasketballTeam.create!({:name => "Cavaliers", :city => "Cleveland"})
    hawks = BasketballTeam.create!({:name => "Hawks", :city => "Atlanta"})

    expect(BasketballTeam.ordered_by_city).to eq([hawks, cavs])
  end
end