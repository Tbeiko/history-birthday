class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string  :actor
      t.string  :action
      t.string  :description
      t.integer :day
      t.integer :month
      t.integer :year
      t.timestamps
    end
  end
end
