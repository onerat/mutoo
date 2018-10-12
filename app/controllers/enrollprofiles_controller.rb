class EnrollprofilesController < ApplicationController
    def index
            @users = User.all
            @extras = Extra.all
       
    end
    
    #프로필 등록하기 (extra db에 값 없는 경우)
    def create
        user = User.find(params[:user_id])
        user.nickname = params[:nickname]
        user.email=params[:email]
        user.instrument=params[:instrument]
        user.region=params[:region]
        user.save
        
        
        extra = Extra.new
        extra.introduce = params[:introduce]
        extra.user_id = params[:user_id]
        if params[:avatar]
            extra.avatar = params[:avatar]
        end
        extra.save
        redirect_to '/home/mypage'
    
    end
    
    #프로필 수정하기 (extra db에 값 있는 경우)
    def show
         @users = User.all
         @extras = Extra.all
    end
    
    def update
        user = User.find(params[:user_id])
        user.nickname = params[:nickname]
        user.email=params[:email]
        user.instrument=params[:instrument]
        user.region=params[:region]
        user.save
        
        
        extra = Extra.find(params[:extra_id])
        extra.introduce = params[:introduce]
        if params[:avatar]
            extra.avatar = params[:avatar]
        end
        extra.user_id = params[:user_id]
       
        extra.save
        redirect_to '/home/mypage'
    
    end
end
