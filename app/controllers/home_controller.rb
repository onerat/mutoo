class HomeController < ApplicationController
    def index
    end
    
    def intro
    end
    
    def mypage
        @users = User.all
        @extras = Extra.all
        @a = 1
    end
    

    # def check_user_login
    #     if @user != User.find(params[:id])
    #         redirect_to root_url
    #     end
    # end
end
