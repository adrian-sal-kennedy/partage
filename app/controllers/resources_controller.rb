class ResourcesController < ApplicationController
  before_action :set_user
  before_action :set_business, only: %i[new show edit destroy]
  before_action :set_resource, only: %i[new edit destroy]
  before_action :authenticate_user!, except: %i[show index]
  load_and_authorize_resource

  def index
    if params[:user_id]
      @businesses = current_user.businesses.includes(:resources)
      @current_userid = current_user.id
    else
      @businesses = Business.includes(:resources)
      if user_signed_in?
        @current_userid = current_user.id
      else
        puts "======= indexing all resources for guest user"
        # user_id is never zero so below will make the view realise our user owns nothing.  
        @current_userid = 0
      end
    end
  end

  def show
    if params[:business_id]
      @business = current_user.businesses.includes(:resources).find(params[:business_id])
    else
      @business = Business.includes(:resources).find(@resource.business_id)
    end
  end

  def new
    # @business = current_user.businesses.find(params[:business_id])
    # @resource = @business.resources.new
    # @user = current_user
  end

  def edit
    # @user = current_user
    # @resource = @user.resources.find(params[:id])
    # @business = current_user.businesses.find(params[:business_id])
  end

  def create
    if @resource.errors.any?
      render :new
    else
      @resource = Resource.create!(resource_params)
      flash[:notice] = "Successfully added #{@resource.name}"
      redirect_to user_resources_path(@user.id)
    end
  end

  def update
    @resource = Resource.find(params[:id]).update(resource_params)
      redirect_to user_resources_path(@user.id)
  end

  def destroy
    flash[:notice] = "Successfully yeeted #{@resource.name}"
    @resource.destroy
    redirect_to user_resources_path(current_user.id)
  end

  private

  def resource_params
    params.require(:resource).permit(
      :name,
      :description,
      :picture,
      :business_id,
      :user_id
    )
  end

  def set_user
    if user_signed_in?
      @user = current_user
    else
      puts "======= indexing all resources for guest user" 
      @user = User.new
    end
    puts "======== resources_controller:set_user, user_id = #{@user.id}"
  end
  def set_business
    puts "======== resources_controller:set_business = #{params[:business_id]}"
    return unless params[:business_id]
    @business = current_user.businesses.includes(:resources).find(params[:business_id])
  end
  def set_resource
    puts "======== resources_controller:set_resource, business_id = #{params[:business_id]}"
    return unless params[:id]
    @resource = current_user.resources.find(params[:id])
  end
end