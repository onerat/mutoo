class CreateFrees < ActiveRecord::Migration
  def change
    create_table :frees do |t|
      t.string :title
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.string :nick
      t.boolean :notice, default: false

      t.timestamps null: false
    end
  end
end
