class CreateCityWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :city_weathers do |t|
      t.integer :city_id
      t.integer :weather_id

      t.timestamps
    end
  end
end
