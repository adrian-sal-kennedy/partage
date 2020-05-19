class ResourcesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_business, only: %i[new create show edit update destroy]
  before_action :set_resource, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    @businesses = current_user.businesses.includes(:resources)
  end

  def show
    @resource = Resource.find(params[:id])
    @business = current_user.businesses.find(params[:business_id])
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