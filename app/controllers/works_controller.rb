class WorksController < ApplicationController
  skip_before_filter :verify_authenticity_token
  #관리자 모든 권한 부여
  load_and_authorize_resource
  
  def new
  end
  
  def create
    @token = form_authenticity_token
    @work = Work.new(work_params)
    @work.save
    redirect_to @work
  end

  def index
    @works = Work.order("created_at DESC").paginate(:page=>params[:page])
  end

  def show
    @work = Work.find(params[:id])
    @wcomments = @work.wcomments
  end

  def edit
    @token = form_authenticity_token
    @work = Work.find(params[:id])
    # check_user
  end
  
  def update
    work = Work.find(params[:id])
    work.wtitle = params[:wtitle]
    work.winstrument = params[:winstrument]
    work.wregion = params[:wregion]
    work.wmusic = params[:wmusic]
    work.winfo = params[:winfo]
    work.save
    
    redirect_to "/works/#{work.id}"
  end
  
  def destroy
    # check_user
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to works_path and return
  end
  
  def search 
    @works = Work.search do
      keywords params[:query]
    end.results
    
    respond_to do |format|
      format.html {render :action => "index"}
      format.xml {render :xml => @posts}
    end
  end
  
  def wlike_toggle
    wlike = Wlike.find_by(user_id: current_user.id, work_id: params[:work_id])
    if wlike.nil?
      Wlike.create(user_id: current_user.id, work_id: params[:work_id])
    else
      wlike.destroy
    end
    redirect_to :back
  end
  
  
  private
  def work_params
    params.permit(:wtitle,:winstrument,:wregion,:wmusic,:winfo,:user_id)
  end
  
  def check_user
    @work = Work.find(params[:id])
    if @work.user != current_user
      redirect_to root_url
    end
  end
end
