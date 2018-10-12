class WcommentsController < ApplicationController
    skip_before_filter :verify_authenticity_token
    load_and_authorize_resource
    
    def create
        @token = form_authenticity_token
        wcomment = Wcomment.new
        wcomment.wccontent = params[:wccontent]
        wcomment.work_id = params[:work_id]
        wcomment.user_id = params[:user_id]
        wcomment.save
        
        redirect_to "/works/#{wcomment.work.id}"
    end
    
    def destroy
        wcomment = Wcomment.find params[:id]
        wcomment.destroy
        redirect_to "/works/#{wcomment.work.id}"
    end
end
