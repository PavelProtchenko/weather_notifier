class CityWeather < ApplicationRecord
  belongs_to :weather
  belongs_to :city
end
