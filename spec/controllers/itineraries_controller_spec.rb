require 'rails_helper'

RSpec.describe ItinerariesController, type: :controller do

    describe "GET itineraries#index" do

        it "assigns @itineraries" do
            itineraries = create_list(:itinerary, 10)

            get :index
            expect(assigns(:itineraries)).to eq(itineraries)
          end

    end

    describe "GET itineraries#new" do

        it "assigns @itinerary" do
            get :new
            expect(assigns(:itinerary).present?).to be true
        end

    end

    describe "POST itineraries#create" do

        describe "with a valid itinerary" do
            before(:each) do
                @attributes = attributes_for(:itinerary)
            end

            it "redirects to the destinations page" do
                post :create, params: {itinerary: @attributes}
                
                @itinerary = assigns(:itinerary)
                response.should redirect_to new_itinerary_destination_path(@itinerary)
            end

            it "should create a new itinerary" do

                expect{
                    post :create, params: {itinerary: @attributes}
                }.to change(Itinerary,:count).by(1)
            end
        end

        describe "with a valid itinerary" do
            before(:each) do
                @attributes = attributes_for(:itinerary)
                @attributes[:start_at] = 1.week.ago
            end

            it "redirects back to the same page" do
                post :create, params: {itinerary: @attributes}
                
                @itinerary = assigns(:itinerary)
                response.should redirect_to new_itinerary_path
            end

            it "should not create a new itinerary" do

                expect{
                    post :create, params: {itinerary: @attributes}
                }.to_not change(Itinerary,:count)
            end
        end




    end

    describe "DELETE itineraries#destroy" do
        before(:each) do
            @itinerary = create(:itinerary)
        end

        it "redirects to the itineraries page" do
            delete :destroy, params: {id: @itinerary.id}
            
            @itinerary = assigns(:itinerary)
            response.should redirect_to itineraries_path
        end

        it "should create a new itinerary" do

            expect{
                delete :destroy, params: {id: @itinerary.id}
            }.to change(Itinerary,:count).by(-1)
        end


    end

end