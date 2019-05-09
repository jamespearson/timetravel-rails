class DestinationsController < ApplicationController

  before_action :find_itinerary

  def index
    @destinations = @itinerary.destinations.order(:index)
  end

  def new
    @destinations = @itinerary.destinations
    @destination = @itinerary.destinations.new
  end

  def create
    @destination = @itinerary.destinations.new(destination_params)
    @destination.index = @itinerary.destinations.maximum(:index) + 1

    if @destination.save
      redirect_to new_itinerary_destination_path(@itinerary)
      flash[:notice] = "Itinerary has been successfuly created"
    else
      redirect_to new_itinerary_destination_path(@itinerary)
      flash[:alert] = "Itinerary has not been created"
    end
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
  end


  def update
    @destination = @itinerary.destinations.find(params[:id])
    @destination.update(destination_params)
    redirect_to new_itinerary_destination_path(@itinerary)
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])

    if @itinerary.destroy
      redirect_to itineraries_path
      flash[:notice] = "Itinerary has been successfuly destroyed"
    else
      redirect_to itineraries_path
      flash[:alert] = "Itinerary has been successfuly destroyed"
    end
  end

  protected

  def find_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def destination_params
    params.require(:destination).permit(:address_line_1, :address_line_2, :city, :post_code, :duration_in_minutes)
  end
end
