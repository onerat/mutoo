class PeopleController < ApplicationController
    
    
    def email_form
        @user = User.find(params[:id])
    end
    
    
    
    def search_profile
        @a = 1
        @users = User.all
        @extras = Extra.all
    end
    
    def base
        @a = 1
        @users = User.all
        @extras = Extra.all
    end
    
    def drum
        @a = 1
        @users = User.all
        @extras = Extra.all
    end
    
    def guitar
        @a = 1
        @users = User.all
        @extras = Extra.all
    end
    
    def keyboard
        @a = 1
        @users = User.all
        @extras = Extra.all
    end
    
    def vocal
        @a = 1
        @users = User.all
        @extras = Extra.all
    end
    
    def etc
        @a = 1
        @users = User.all
        @extras = Extra.all
    end
    
end




#세영 연주자 찾기 - 프로필