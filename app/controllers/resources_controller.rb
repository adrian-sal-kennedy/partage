class ResourcesController < ApplicationController
  before_action :set_resource, only: %i[show edit update destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource

  def index
    @businesses = current_user.business.includes(:resource)
  end

  def show
  end

  def new
    @resource = Resource.new
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def create
    @resource = Resource.create(resource_params)
    redirect_to resources_path
  end

  def update
    @resource = Resource.find(params[:id]).update(resource_params)
    redirect_to resources_path
  end

  def destroy
    @resource = Resource.find(params[:id]).destroy
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

  def set_resource
    @resource = Resource.find(params[:id])
  end
end