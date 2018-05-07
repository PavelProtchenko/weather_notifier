class CreateWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :weathers do |t|
      t.float :temp
      t.float :pressure
      t.float :humidity
      t.float :temp_min
      t.float :temp_max

      t.timestamps
    end
  end
end
