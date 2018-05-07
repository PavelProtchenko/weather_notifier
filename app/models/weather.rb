class Weather < ApplicationRecord
  has_one :city
  has_one :city, through: :city_weather
end
