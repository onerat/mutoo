class Extra < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "390x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /^image\/(jpeg|png|gif|tiff)$/
  belongs_to :user
end
