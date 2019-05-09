require 'rails_helper'

RSpec.describe DestinationsController, type: :controller do
    before(:each) do
        @itinerary = create(:itinerary)
    end

    describe "GET destinations#index" do

        it "assigns @destinations" do            
            destinations = create_list(:destination, 10, itinerary: @itinerary )

            get :index, params: {itinerary_id: @itinerary.id}

            expect(assigns(:destinations).length).to eq(@itinerary.destinations.order(:index).length)
            expect(assigns(:destinations).to_json).to eq(@itinerary.destinations.order(:index).to_json)
          end

    end

    describe "GET destinations#new" do

        it "assigns @destination" do
            get :new, params: {itinerary_id: @itinerary.id}
            expect(assigns(:destination).present?).to be true
            expect(assigns(:destinations).present?).to be true
        end

    end

    # describe "POST destinations#create" do

    #     describe "with a valid destination" do
    #         before(:each) do
    #             @attributes = attributes_for(:destination, itinerary: @itinerary)
    #         end

    #         it "redirects to the destinations page" do
    #             post :create, params: {itinerary_id: @itinerary.id, destination: @attributes}
                
    #             @itinerary = assigns(:itinerary)
    #             response.should redirect_to new_itinerary_destination_path(@itinerary)
    #         end

    #         it "should create a new destination" do
    #             expect{
    #                 post :create, params: {itinerary_id: @itinerary.id, destination: @attributes}
    #             }.to change(@itinerary.destinations,:count).by(1)
    #         end
    #     end

    #     describe "with an invalid itinerary" do
    #         before(:each) do
    #             @attributes = attributes_for(:destination)
    #             @attributes[:duration_in_minutes] = -60
    #         end

    #         it "redirects back to the same page" do
    #             post :create, params: {itinerary_id: @itinerary.id, destination: @attributes}
                
    #             @itinerary = assigns(:itinerary)
    #             response.should redirect_to new_itinerary_path
    #         end

    #         it "should not create a new itinerary" do

    #             expect{
    #                 post :create, params: {itinerary_id: @itinerary.id, destination: @attributes}
    #             }.to_not change(@itinerary.destinations,:count)
    #         end
    #     end




    # end

    # describe "DELETE itineraries#destroy" do
    #     before(:each) do
    #         @itinerary = create(:itinerary)
    #     end

    #     it "redirects to the itineraries page" do
    #         delete :destroy, params: {id: @itinerary.id}
            
    #         @itinerary = assigns(:itinerary)
    #         response.should redirect_to itineraries_path
    #     end

    #     it "should create a new itinerary" do

    #         expect{
    #             delete :destroy, params: {id: @itinerary.id}
    #         }.to change(Itinerary,:count).by(-1)
    #     end


    # end

end