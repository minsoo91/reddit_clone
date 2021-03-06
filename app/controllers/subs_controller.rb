class SubsController < ApplicationController
  before_action :require_login
  before_action :is_a_moderator, only: [:edit, :update]

  def index
    @subs = Sub.all
    render :index
  end
  
  def show
    @subs = Sub.all
    @sub = Sub.find(params[:id])
    render :show
  end
  
  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end
  
  def new
    @sub = Sub.new
    render :new
  end
  
  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:notice] = @sub.errors.full_messages
      render :new
    end
    
  end
  
  def update
    @sub = Sub.find(params[:id])
    
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:notice] = @sub.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy!
    redirect_to user_url
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
