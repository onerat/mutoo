class AddAttachmentAvatarToFrees < ActiveRecord::Migration
  def self.up
    change_table :frees do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :frees, :avatar
  end
end
