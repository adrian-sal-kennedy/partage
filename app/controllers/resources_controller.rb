class ResourcesController < ApplicationController
  before_action :set_resource, only: %i[show edit update destroy]
  before_action :set_business
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @businesses = current_user.businesses.includes(:resources)
  end

  def show
  end

  def new
    # @resource = Resource.new
    # @business = current_user.businesses.find(params[:business_id])
  end

  def edit
    # @resource = Resource.find(params[:id])
  end

  def create
    @resource = current_user.businesses.find(:business_id).resources.create(resource_params)
    # @resource = Resource.create(resource_params)
    redirect_to resources_path
  end
  # def create
  #   @business = current_user.business.create(business_params)
  #   if @business.errors.any?
  #     flash[:alert] = "Something went wrong."
  #     render :new
  #   else
  #     flash[:success] = "#{@business.name} successfully created!"
  #     redirect_to businesses_path
  #   end
  # end

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
  def set_business
    # return unless params[:business_id]
    @business = Business.find(params[:business_id])
  end
end