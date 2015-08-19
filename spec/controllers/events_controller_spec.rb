require 'spec_helper'

describe EventsController do 
  describe "GET show" do 
    context "without set date" do 
      it "should set the @event variable to nil" do 
        get :show
        expect(assigns(:event)).to be_nil
      end 
      it "should render the show template" do 
        get :show
        expect(response).to render_template :show
      end 
    end
  end

  describe "POST show" do 
    context "with invalid input" do 
      it "should give an error message"
      it "should render the show template"
    end

    context "with valid input" do 

      before do 
        3.times { Fabricate(:event) }
      end

      let(:first_event) { Event.first } 

      it "should render the show template" do 
        post :show, event: { day: first_event.day, month: first_event.month, year: first_event.year }
        expect(response).to render_template :show
      end

      it "should set the @event variable to an event with the same day and year as the params if there is only one match" do 
        post :show, event: { day: first_event.day, month: first_event.month, year: first_event.year }
        expect(assigns(:events).count).to eq(1)
        expect(assigns(:event).day).to eq(first_event.day)
      end

      it "should set the @event variable to a random event with the same day and month as the params if there is more than one event on the same day" do 
        Fabricate(:event, day: first_event.day, month: first_event.month)
        post :show, event: { day: first_event.day, month: first_event.month, year: first_event.year }
        expect(assigns(:events).count).to eq(2)
        expect(assigns(:event).day).to eq(first_event.day)
      end
    end
  end
end