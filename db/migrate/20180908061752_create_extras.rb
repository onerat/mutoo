class CreateExtras < ActiveRecord::Migration
  def change
    create_table :extras do |t|
      t.text :introduce
      t.string :img_url
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
