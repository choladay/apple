require 'rails_helper'
include GeocoderHelper
include Geocoder

RSpec.describe WeatherReport, type: :model do
  describe "initializer" do
    let(:cupertino_ca) { "Cupertino, CA" }
    before(:each) do
      stub_cupertino_geocode
    end

    context "parsing address into a geolocation" do
      before(:each) do
        # Weather report out of scope for this context
        allow_any_instance_of(WeatherReport).to receive(:fetch_weather_report!).and_return(nil)
      end

      it "should set #geo data when passed an address" do
        weather_report = WeatherReport.new(address: cupertino_ca)

        expect(weather_report.geo.data).to be_present
      end

      it "should set #lat, #lng, and #zip_code when passed an address" do
        weather_report = WeatherReport.new(address: cupertino_ca)

        expect(weather_report.lat).to eq(37.3228934)
        expect(weather_report.lng).to eq(-122.0322895)
        expect(weather_report.zip_code).to eq("95014")
      end
    end

    context "getting current weather" do
      it "should set #geo when passed an address" do
        current_temp, min_temp, max_temp = [ double ] * 3

        expect(Api::OpenWeatherMap).to receive(:fetch!).with(37.3228934, -122.0322895).and_return(
          {
            current: current_temp,
            min: min_temp,
            max: max_temp
          }
        )

        weather_report = WeatherReport.new(address: cupertino_ca)

        expect(weather_report.temp_current).to eq(current_temp)
        expect(weather_report.temp_min).to eq(current_temp)
        expect(weather_report.temp_max).to eq(current_temp)
      end
    end
  end
end
