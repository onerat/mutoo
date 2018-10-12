class Free < ActiveRecord::Base
  #관리자권한부여
  resourcify
    
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /^image\/(jpeg|png|gif|tiff)$/

  validates_attachment_size :avatar, :in => 0..10.megabytes    
    
  belongs_to :user
  has_many :fcomments
  has_many :impressions, :as=>:impressionable
 
   def impression_count
       impressions.size
   end
 
   def unique_impression_count
       # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
       # so getting keys from the hash and calculating the number of keys
       impressions.group(:ip_address).size.keys.length #TESTED
   end
   
   searchable do
    text :title, :default_boost => 2 #제목
    text :content # 내용
  end
   
end
