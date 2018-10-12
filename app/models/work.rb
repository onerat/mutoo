class Work < ActiveRecord::Base
    #관리자권한부여
    resourcify
    
    validates_presence_of :wtitle, :winstrument, :wregion, :wmusic
    searchable do
        text :wtitle
        text :winstrument
        text :wregion
        text :wmusic
    end
    
    belongs_to :user
    has_many :wcomments
    has_many :wlikes
   
    validates :user, presence: true
    self.per_page = 10
end
