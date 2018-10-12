class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      
      t.string :instrument
      t.string :nickname
      t.string :image_url
      t.string :email_form
      t.string :talk
      
      t.timestamps null: false
    end
  end
end
