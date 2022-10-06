require 'httparty'
require 'json'

module Weather
  class Geo
    def self.get_coordinates_by_address(address:)

      puts "=== get_coordinates_by_address"
      puts "    address:"
      puts "    #{address}"

      results = Geocoder.search(address)
      if results.count > 0
        return results.first.coordinates
      else
        puts "ERROR: Geocoder failed on address search."
        return false
      end
    end
  end
  class Forecast
    def self.get_forecast_by_coordinates(lat:,lon:)
      
      puts "=== get_forecast_by_coordinates"
      puts "    coordinates:"
      puts "    #{lat}, #{lon} "

      #get the points from weather api
      response = HTTParty.get("https://api.weather.gov/points/#{lat},#{lon}")
      
      2.times do 
        break if response.code == 200
        puts "trying weather.gov api again..."
        response = HTTParty.get("https://api.weather.gov/points/#{lat},#{lon}")
      end

      return false if response.code != 200

      points = JSON.parse(response.body)
      url_forecast = points["properties"]["forecast"]

      #get the weather forecast
      results = JSON.parse(HTTParty.get(points["properties"]["forecast"]))
      
      results[:cached_time] = Time.now.to_i

      return results

    end
  end
end

class Wx < ApplicationRecord

  validates :postal_code, presence: true 
  validates :city, presence: true
  validates :state_or_province, presence: true

  def get_weather(postal_code:, address:)

    return false if postal_code.nil? || address.nil?

    weather = weather_cache(postal_code: postal_code, address: address)
    2.times do
      break if weather.class == Hash && weather.include?("properties")
      weather = weather_cache(postal_code: postal_code, address: address)
    end
    if weather == false || weather.class == Hash && weather.include?("properties") == false
      return false
    else
      return weather
    end
  end

  def weather_cache(postal_code:, address:)
    Rails.cache.fetch("#{postal_code}/get_weather", expires_in: 30.minutes) do
      coordinates = Weather::Geo.get_coordinates_by_address(address: address)
      return false if coordinates == false
      Weather::Forecast.get_forecast_by_coordinates(lat: coordinates[0], lon: coordinates[1])
    end
  end

end
