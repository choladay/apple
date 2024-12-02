class WeatherReportController < ApplicationController
  def index
    if params[:address].present?
      @cache_hit = true
      @weather_report = Rails.cache.fetch("weather_lookup/#{Digest::SHA1.hexdigest(params[:address])}", expires_in: 30.minutes) do
        @cache_hit = false
        WeatherReport.new(address: params[:address])
      end
    end
  end
end
