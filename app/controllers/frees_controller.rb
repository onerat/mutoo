class FreesController < ApplicationController
   load_and_authorize_resource
  # before_action :set_free, only: [:show, :edit, :update, :destroy]
  # before_action :is_writer?, only: [:edit, :update, :destroy]
  before_action :log_impression, :only=> [:show]
  
  # GET /frees
  # GET /frees.json
  def index
    @notis = Free.all
    @frees = Free.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end
  
  def search
    @notis = Free.all
    @frees = Free.search do
        keywords params[:search]
    end.results
    
    respond_to do |format|
    format.html {render :action => "index"}
    format.xml {render :xml => @posts}
    end
  end
  
  # GET /frees/1
  # GET /frees/1.json
  def show
    @fcomment = Fcomment.new
    @fcomment = @free.fcomments
  end

  # GET /frees/new
  def new
    @free = Free.new
  end

  # GET /frees/1/edit
  def edit
  end

  # POST /frees
  # POST /frees.json
  def create
    @free = Free.new(free_params)
    respond_to do |format|
      if @free.save
        format.html { redirect_to @free, notice: 'Free was successfully created.' }
        format.json { render :show, status: :created, location: @free }
      else
        format.html { render :new }
        format.json { render json: @free.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frees/1
  # PATCH/PUT /frees/1.json
  def update
    respond_to do |format|
      if @free.update(free_params)
        format.html { redirect_to @free, notice: 'Free was successfully updated.' }
        format.json { render :show, status: :ok, location: @free }
      else
        format.html { render :edit }
        format.json { render json: @free.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frees/1
  # DELETE /frees/1.json
  def destroy
    @free.destroy
    respond_to do |format|
      format.html { redirect_to frees_url, notice: 'Free was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def log_impression
    if user_signed_in?
      @hit_post = Free.find(params[:id])
      # this assumes you have a current_user method in your authentication system
      @hit_post.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_free
      @free = Free.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def free_params
      # if user_signed_in?
        params[:free][:user_id] = current_user.id
        params.require(:free).permit(:title, :content, :user_id, :nick, :notice, :avatar)
      # end
    end
    
    def is_writer?
      redirect_to @free unless @free.user == current_user
    end
    
end
