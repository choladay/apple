class Api::OpenWeatherMap
  require "http"

  API_KEY = "".freeze
  API_URL = "https://api.openweathermap.org/data/2.5/weather".freeze

  class << self
    def fetch!(lat, lng)
      response = HTTP.get(API_URL, params: { appid: API_KEY, lat: lat, lon: lng, units: "imperial" })
      payload = response.parse["main"]

      {
        current: payload["temp"],
        min: payload["temp_min"],
        max: payload["temp_max"]
      }
    end
  end
end
