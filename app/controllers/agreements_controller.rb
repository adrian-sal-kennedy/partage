class AgreementsController < ApplicationController
  before_action :set_user
  before_action :set_business, only: %i[new]
  before_action :set_resource, only: %i[new create]
  before_action :set_agreement, only: %i[new create]
  before_action :set_user_agreement, only: %i[show edit destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @businesses = current_user.businesses.includes(resources: [:agreements])
    @resources = Resource.includes(:agreements).all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @agreement.errors.any?
      render :new
    else
      @agreement = Agreement.create!(agreement_params)
      flash[:notice] = "Successfully added agreement for #{@resource.name}"
      redirect_to user_agreements_path(@user.id)
    end
  end

  def update
  end

  def destroy
  end

  private

  def agreement_params
    params.require(:agreement).permit(
      :price,
      :terms,
      :resource_id,
      :business_id
    )
  end

  def set_user
    if user_signed_in?
      @user = current_user
    else
      puts "======= indexing all agreements for guest user" 
      @user = User.new
    end
    puts "======== agreements_controller:set_user, user_id = #{@user.id}"
  end
  def set_business
    if params[:business_id]
      @business = current_user.businesses.includes(resources: [:agreements]).find(params[:business_id])
    else
      @business = Business.all.includes(:resources).find(Resource.all.find(params[:id]).business_id)
    end
    puts "======== agreements_controller:set_business = #{@business.id}"
  end
  def set_resource
    if params[:resource_id]
      @resource = @business.resources.includes(:agreements).find(params[:resource_id])
      puts "======== agreements_controller:set_resource = #{@resource.id}, business_id = #{@business.id}"
    else
      @resource = Resource.all.includes(:agreements).find(params[:agreement][:id])
      puts "======== agreements_controller:set_resource = #{@resource.id}, business_id = #{@resource.business_id}"
    end
  end
  def set_agreement
    puts "======== agreements_controller:set_agreement, resource_id = #{@resource.id}"
    return unless params[:id]
    @agreement = current_user.agreements.find(params[:id])
  end
  def set_user_agreement
    @agreement = Agreement.find(params[:id])
    @resource = Resource.find(@agreement.resource_id)
  end
end