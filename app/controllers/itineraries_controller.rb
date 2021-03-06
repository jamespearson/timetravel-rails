class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)

    if @itinerary.save
      redirect_to new_itinerary_destination_path(@itinerary)
      flash[:notice] = "Itinerary has been successfuly created"
    else
      redirect_to new_itinerary_path
      flash[:alert] = "Itinerary has not been created"
    end
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    @itinerary.update(itinerary_params)
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

  private

  def itinerary_params
    params.require(:itinerary).permit(:agent_name, :start_at)
  end
end