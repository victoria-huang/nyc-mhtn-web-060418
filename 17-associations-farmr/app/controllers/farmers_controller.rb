class FarmersController < ApplicationController
  before_action :get_farmer, only: [:show, :edit, :update, :destroy]

  def index
    @farmers = Farmer.all
  end

  def show
  end

  def new
    @farmer = Farmer.new
    2.times { @farmer.cows.build }
  end

  def create
    @farmer = Farmer.new(farmer_params)

    if @farmer.save
      redirect_to @farmer
    else
      flash[:errors] = @farmer.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @farmer.update(farmer_params)
    
    if @farmer.valid?
      redirect_to @farmer
    else
      flash[:errors] = @farmer.errors.full_messages
      render :edit
    end
  end

  def destroy
    @farmer.destroy
    redirect_to farmers_path
  end

  private
  def farmer_params
    params.require(:farmer).permit(:name, cows_attributes: [:id, :name, :spots])
  end

  def get_farmer
    @farmer = Farmer.find(params[:id])
  end
end
