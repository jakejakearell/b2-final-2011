class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :number
      t.integer :time
      t.string :departure_city
      t.string :arrival_city
      t.date :date

      t.timestamps
    end
  end
end
