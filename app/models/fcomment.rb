class Fcomment < ActiveRecord::Base
  #관리자권한부여
  resourcify
  
  belongs_to :user
  belongs_to :free
end
