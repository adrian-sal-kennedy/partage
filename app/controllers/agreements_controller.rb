class AgreementsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_business, only: %i[new create show edit update destroy]
  before_action :set_resource, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    if params[:user_id]
      @businesses = current_user.businesses.includes(resources: [:agreements])
    else
      flash.now[:alert] = "You must log in to see your agreements."
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def agreement_params
    params.require(:agreement).permit(
      :price,
      :terms
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