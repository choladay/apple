require 'rails_helper'
include GeocoderHelper
include Geocoder

RSpec.describe WeatherReport, type: :model do
  describe "initializer" do
    let(:cupertino_geo) {  }

    it "should set #geo when passed an address" do
      stub_cupertino_geocode

      weather_report = WeatherReport.new(address: "Cupertino, CA")

      expect(weather_report.geo.data).to include("address": 'Cupertino, CA, USA')
    end

    it "should set #zip_code when passed an address" do
      address = "Cupertino, CA"
      expect(Geocoder).to receive(:search).with(address).and_return(
        [ double(data: JSON.parse(file_fixture("geoapify/cupertino.json").read)) ]
      )

      weather_report = WeatherReport.new(address: address)

      expect(weather_report.zip_code).to eq("95014")
    end
  end
end
