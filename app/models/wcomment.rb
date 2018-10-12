class Wcomment < ActiveRecord::Base
  resourcify
  
  belongs_to :work
  belongs_to :user
end
