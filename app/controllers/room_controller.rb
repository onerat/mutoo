class RoomController < ApplicationController
    def index
    end
    
    def find_room
        @rooms = Room.all
    end
    
    def seoul
        @rooms = Room.all
    end
    
    def gyeonggi
        @rooms = Room.all
    end
    
    def gangwon
        @rooms = Room.all
    end
    
    def chungcheong
        @rooms = Room.all
    end
    
    def gyeongsang
        @rooms = Room.all
    end
    
    def jeju
        @rooms = Room.all
    end
    
    def jeolla
        @rooms = Room.all
    end
    
    def incheon
        @rooms = Room.all
    end
    
    def siteview
        @rooms = Room.all
    end
    
end
