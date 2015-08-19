require 'spec_helper'

describe EventsController do 
  describe "GET index" do 
    context "without set date" do 
      it "should set the @event variable to nil" do 
        get :index
        expect(assigns(:event)).to be_nil
      end 
      it "should render the index template" do 
        get :index
        expect(response).to render_template :index
      end 
    end
  end

  describe "POST index" do 
      before do 
        3.times { Fabricate(:event) }
      end
    context "with invalid input" do 
      it "should set the @event variable to nil" do 
        post :index, { month: 01, year: 1992 }
        expect(assigns(:event)).to be_nil
      end
      it "should render the index template" do 
        post :index, { month: 01, year: 1992 }
        expect(response).to render_template :index
      end
      # Will implement later
      # it "should give an error message"
    end

    context "with valid input" do 
      let(:first_event) { Event.first } 

      it "should render the index template" do 
        post :index, { day: first_event.day, month: first_event.month, year: first_event.year }
        expect(response).to render_template :index
      end

      it "should set the @event variable to an event with the same day and year as the params if there is only one match" do 
        post :index, { day: first_event.day, month: first_event.month, year: first_event.year }
        expect(assigns(:events).count).to eq(1)
        expect(assigns(:event).day).to eq(first_event.day)
      end

      it "should set the @event variable to a random event with the same day and month as the params if there is more than one event on the same day" do 
        Fabricate(:event, day: first_event.day, month: first_event.month)
        post :index, { day: first_event.day, month: first_event.month, year: first_event.year }
        expect(assigns(:events).count).to eq(2)
        expect(assigns(:event).day).to eq(first_event.day)
      end
    end
  end
end