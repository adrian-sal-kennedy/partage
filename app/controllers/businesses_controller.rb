class BusinessesController < ApplicationController
  before_action :set_business, only: %i[show edit update destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    # @businesses = current_user.business.includes(resource: [:agreements])
    @businesses = current_user.businesses.includes(:resources)
  end

  def show
  end

  def new
    @business = Business.new
  end

  def edit
    @business = Business.find(params[:id])
  end

  def create
    @business = current_user.businesses.create(business_params)
    if @business.errors.any?
      flash[:alert] = "Something went wrong."
      render :new
    else
      flash[:success] = "#{@business.name} successfully created!"
      redirect_to businesses_path
    end
  end

  def update
    @business = current_user.businesses.find(params[:id]).update(business_params)
    redirect_to businesses_path
  end

  def destroy
    @business = current_user.businesses.find(params[:id]).destroy
    redirect_to businesses_path
  end

  private

  def business_params
    params.require(:business).permit(
      :name,
      :url,
      :location,
      :description
    )
  end

  def set_business
    @business = Business.find(params[:id])
  end
end