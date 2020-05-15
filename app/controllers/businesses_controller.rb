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
  end

  def create
  end

  def update
  end

  def destroy
  end
end
