class CreateSetDates < ActiveRecord::Migration
  def change
    create_table :set_dates do |t|
      t.integer :day
      t.integer :month
      t.integer :year
      t.timestamps
    end
  end
end
