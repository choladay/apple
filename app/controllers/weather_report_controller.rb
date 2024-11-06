class WeatherReportController < ApplicationController
  def index
    if params[:address].present?
      @weather_report = WeatherReport.new(address: params[:address])
    end
  end
end
