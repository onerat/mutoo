class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :wtitle
      t.string :winstrument
      t.string :wregion
      t.string :wmusic
      t.string :winfo
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
