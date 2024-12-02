require 'rails_helper'

RSpec.describe Api::OpenWeatherMap, type: :model do
  describe ".fetch!" do
    it "should return a hash with current, min and max keys" do
      response = double
      payload = HashWithIndifferentAccess.new("main": {
        "temp": current_temp = double,
        "temp_min": min_temp = double,
        "temp_max": max_temp = double
      })
      expect(HTTP).to receive(:get).and_return(response)
      expect(response).to receive(:parse).and_return(payload)

      results = Api::OpenWeatherMap.fetch!(double, double)

      expect(results[:current]).to eq(current_temp)
      expect(results[:min]).to eq(temp_min)
      expect(results[:max]).to eq(temp_max)
    end
  end
end
