class AddAttachmentAvatarToExtras < ActiveRecord::Migration
  def self.up
    change_table :extras do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :extras, :avatar
  end
end
