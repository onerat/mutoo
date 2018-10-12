class CreateWcomments < ActiveRecord::Migration
  def change
    create_table :wcomments do |t|
      t.string :wccontent
      t.belongs_to :work, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
