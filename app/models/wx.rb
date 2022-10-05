require 'httparty'

module Weather
  class Geo
    def self.get_coordinates_by_address(address:)
      results = Geocoder.search(address)
      return results.first.coordinates
    end
  end
  class Forecast
    def self.get_forecast_by_coordinates(lat:,lon:)
      return HTTParty.get("https://api.weather.gov/points/#{lat},#{lon}")
    end
  end
end

class Wx < ApplicationRecord
  def set_location(address:)
    coordinates = Weather::Geo.get_coordinates_by_address(address: address)
    weather = Weather::Forecast.get_forecast_by_coordinates(lat: coordinates[0], lon: coordinates[1])

    puts "==================="
    puts "coordinates:"
    p coordinates
    puts "weather:"
    p weather
    puts "==================="

  end
end
