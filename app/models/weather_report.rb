class WeatherReport
  include ActiveModel

  attr_accessor :address, :geo, :lat, :lng, :temp_current, :temp_min, :temp_max, :zip_code

  def initialize(params)
    if params[:address].present?
      self.address = params[:address]
      fetch_geo_by_address!
      fetch_weather_report!
    end
  end

private

  def fetch_geo_by_address!
    self.geo = Geocoder.search(address).first

    if geo.present? && geo.data["properties"].present?
      self.lat = geo.data["properties"]["lat"]
      self.lng = geo.data["properties"]["lon"]
      self.zip_code = geo.data["properties"]["postcode"]
    end
  end

  def fetch_weather_report!
    weather = Api::OpenWeatherMap.fetch!(lat, lng)

    self.temp_current = weather[:current]
    self.temp_min = weather[:min]
    self.temp_max = weather[:max]
  end
end
