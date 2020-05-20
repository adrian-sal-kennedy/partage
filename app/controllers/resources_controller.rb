class ResourcesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  before_action :set_business, only: %i[new create show edit update destroy]
  before_action :set_resource, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    if params[:user_id]
      @businesses = current_user.businesses.includes(:resources)
      @current_userid = current_user.id
    else
      @businesses = Business.includes(:resources)
      # user_id is never zero so below will make the view realise our user owns nothing.
      @current_userid = 0
    end
  end

  def show
    @resource = Resource.find(params[:id])
    if params[:business_id]
      @business = current_user.businesses.find(params[:business_id])
    else
      @business = Business.includes(:resources).find(@resource.business_id)
    end
  end

  def new
  end

  def edit
    @resource = Resource.find(params[:id])
    @business = current_user.businesses.find(params[:business_id])
  end

  def create
    @resource = @business.resources.create(resource_params)
    flash[:success] = "Successfully added #{@resource.name}"
    redirect_to resources_path
  end

  def update
    @resource = Resource.find(params[:id]).update(resource_params)
    redirect_to resources_path
  end

  def destroy
    flash[:success] = "Successfully yeeted #{@resource.name}"
    @resource.destroy
    redirect_to resources_path
  end

  private

  def resource_params
    params.require(:resource).permit(
      :name,
      :description,
      :picture
    )
  end

  def set_business
    return unless params[:business_id]
    @business = current_user.businesses.find(params[:business_id])
  end
  def set_resource
    @resource = Resource.find(params[:id])
  end
end