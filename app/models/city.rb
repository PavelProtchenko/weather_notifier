class City < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  has_many :city_weather
  has_many :weather, dependent: :destroy
  has_many :weather, through: :city_weather, dependent: :destroy
end
