class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :station_id, null: false
      t.text :display_name, null: true
      t.boolean :active, null: false, default: false
      t.timestamps null: false
    end
  end
end
