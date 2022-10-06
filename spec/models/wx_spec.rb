require 'rails_helper'

RSpec.describe Wx, type: :model do
  describe 'Weather API' do
    context 'When a new address is requested' do
      
      it 'Geocoder gem gets the coordinates by address' do
        coordinates = Weather::Geo.get_coordinates_by_address(address: "1 Infinite Loop, Cupertino, CA 95014-2084 USA")
        
        expect(coordinates.class).to eq(Array)
        expect(coordinates.count).to eq(2)
        expect(coordinates[0]).to eq(37.3316697)
        expect(coordinates[1]).to eq(-122.03009820215502)
      end

      it 'Weather.gov API returns the weather based on the call with the coordinates' do
        weather = Weather::Forecast.get_forecast_by_coordinates(lat: "37.3316697",lon: "-122.03009820215502")

        expect(weather.class).to eq(Hash)
        expect(weather["properties"]["periods"].count).to eq(14)

      end

      it 'gets the weather in Cupertino from the "get_weather" method in the Wx model' do
        wx = Wx.new
        weather = wx.get_weather(postal_code: "95014-2084", address: "1 Infinite Loop, Cupertino, CA 95014-2084 USA")
        expect(weather.class).to eq(Hash)
        expect(weather["properties"]["periods"].count).to eq(14)
      end

    end
  end
end
