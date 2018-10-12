class CreateFcomments < ActiveRecord::Migration
  def change
    create_table :fcomments do |t|
      t.string :fcontent
      t.references :user, index: true, foreign_key: true
      t.references :free, index: true, foreign_key: true
      t.string :nick

      t.timestamps null: false
    end
  end
end
