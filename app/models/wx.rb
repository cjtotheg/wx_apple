require 'httparty'
require 'json'

module Weather
  class Geo
    def self.get_coordinates_by_address(address:)
      results = Geocoder.search(address)
      return results.first.coordinates
    end
  end
  class Forecast
    def self.get_forecast_by_coordinates(lat:,lon:)
      
      #get the points from weather api
      response = HTTParty.get("https://api.weather.gov/points/#{lat},#{lon}")
      
      5.times do 
        break if response.code == 200
        puts "trying weather.gov api again..."
        response = HTTParty.get("https://api.weather.gov/points/#{lat},#{lon}")
      end

      return false if response.code != 200

      points = JSON.parse(response.body)
      url_forecast = points["properties"]["forecast"]

      #get the weather forecast
      return JSON.parse(HTTParty.get(points["properties"]["forecast"]))

    end
  end
end

class Wx < ApplicationRecord
  def get_weather_no_cache(address:)
    coordinates = Weather::Geo.get_coordinates_by_address(address: address)
    weather = Weather::Forecast.get_forecast_by_coordinates(lat: coordinates[0], lon: coordinates[1])
    
    return weather
  end

  def weather_cache(postal_code:, address:)
    Rails.cache.fetch("#{postal_code}/get_weather", expires_in: 30.minutes) do
      coordinates = Weather::Geo.get_coordinates_by_address(address: address)
      Weather::Forecast.get_forecast_by_coordinates(lat: coordinates[0], lon: coordinates[1])
    end
  end

  def get_weather(postal_code:, address:)
    
    weather = weather_cache(postal_code: postal_code, address: address)

    if weather == false
      #try again...
      puts "Cached weather had a problem.. trying again."
      Rails.cache.delete("#{postal_code}/get_weather")
      
      weather = weather_cache(postal_code: postal_code, address: address)
    end

    puts "what is the weather we return?..."
    p weather

    return weather 

  end

  def get_weather_by_zip(zip:)

  end

end
