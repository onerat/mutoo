class FcommentsController < ApplicationController
  #관리자 모든 권한 부여
  load_and_authorize_resource
  
  def create
    fcomment = Fcomment.new(fcomment_params)
    fcomment.free_id = params[:free_id] 
    fcomment.save
    
    redirect_to :back
  end

  def destroy
    fcomment = Fcomment.find(params[:id])
    fcomment.destroy
    
    redirect_to :back
  end
  
  def fcomment_params
    params.require(:fcomment).permit(:fcontent, :user_id, :free_id, :nick)
  end
end
