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
      it "should set the @event variable to nil if a required_param is missing" do 
        post :index, { month: 01, year: 1992 }
        expect(assigns(:event)).to be_nil
      end

      it "should set @invalid to true if the date is higher than 31" do 
          post :index, { day: 32, month: 01, year: 1990 }
          expect(assigns(:invalid)).to be_truthy
      end

      it "should set @invalid to true if the month is higher than 12" do 
          post :index, { day: 30, month: 13, year: 1990 }
          expect(assigns(:invalid)).to be_truthy
      end

      it "should set @invalid to true if the year is higher than 2100" do 
          post :index, { day: 30, month: 12, year: 2101 }
          expect(assigns(:invalid)).to be_truthy
      end

      it "should set @invalid to true if the month is april and the date is higher than 30" do 
        post :index, { day: 31, month: 4, year: 2000 }
        expect(assigns(:invalid)).to be_truthy
      end

      it "should set @invalid to true if the month is june and the date is higher than 30" do 
        post :index, { day: 31, month: 6, year: 2000 }
        expect(assigns(:invalid)).to be_truthy
      end

      it "should set @invalid to true if the month is september and the date is higher than 30" do 
        post :index, { day: 31, month: 9, year: 2000 }
        expect(assigns(:invalid)).to be_truthy
      end

      it "should set @invalid to true if the month is november and the date is higher than 30" do 
        post :index, { day: 31, month: 11, year: 2000 }
        expect(assigns(:invalid)).to be_truthy      
      end

      it "should set @invalid to true if the month is febuary and the year is divisible by 4 and the date is higher than 29" do 
        post :index, { day: 30, month: 2, year: 2000 }
        expect(assigns(:invalid)).to be_truthy      
      end

      it "if the month is febuary and the year is not divisible by 4 and the date is higher than 28" do 
        post :index, { day: 29, month: 2, year: 2001 }
        expect(assigns(:invalid)).to be_truthy      
      end

      it "should render the index template" do 
        post :index, { month: 01, year: 1992 }
        expect(response).to render_template :index
      end

      it "should give an error message"
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

      it "should set the @invalid variable to false" do 
        post :index, { day: 29, month: 2, year: 2000}
        expect(assigns(:invalid)).to be_falsy      
      end
    end
  end
end