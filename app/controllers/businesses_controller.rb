class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
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
    @business = Business.create(business_params)
    redirect_to businesses_path
  end

  def update
    @business = Business.find(params[:id]).update(business_params)
    redirect_to businesses_path
  end

  def destroy
    @business = Business.find(params[:id]).destroy
    redirect_to businesses_path
  end
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