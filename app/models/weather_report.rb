class WeatherReport
  include ActiveModel

  attr_accessor :address, :geo, :zip_code

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
      self.zip_code = geo.data["properties"]["postcode"]
    end
  end

  def fetch_weather_report!
  end
end
