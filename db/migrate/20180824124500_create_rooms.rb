class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_img
      t.string :room_area
      t.string :room_name
      t.string :room_view
      
      t.timestamps null: false
    end
  end
end
