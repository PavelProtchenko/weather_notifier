require 'open-uri'
require 'json'
class WeatherJob < ApplicationJob
  queue_as :weather_notifier_development_default

  def perform(weather)
  	# sleep 5
  	# puts "Hello World"
    cities = City.all

    cities.each do |city|

	  api_key = '71cf9e4fddb3e2dfd076a7f0b5581e08'
    # url to test it in web browser
	  # http://api.openweathermap.org/data/2.5/weather?q=London&units=metric&APPID=71cf9e4fddb3e2dfd076a7f0b5581e08
	  city_address = city.address
    
    # if you wanna see temperature in Celsius use option &units=metric
    # on default without this option you will get temperature in Kelvins
    # and use &units=imperial if you wanna get temperature in Fahrenheit
	  request = "http://api.openweathermap.org/data/2.5/weather?q=#{city_address}&units=metric&APPID=#{api_key}"

	  response = open(request).readlines.join
	  
	  weather_city = JSON.parse( response )
        
	  weather = Weather.create({temp: weather_city['main']['temp'],
                                pressure: weather_city['main']['pressure'],
                                humidity: weather_city['main']['humidity'],
                                temp_min: weather_city['main']['temp_min'],
                                temp_max: weather_city['main']['temp_max']
                              })

    c = city.id
    w = weather.id
    city_weather = CityWeather.create(city_id: c, weather_id: w)
    city_weather.save
	  end
  end
end