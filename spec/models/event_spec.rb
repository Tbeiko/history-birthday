require 'spec_helper'

describe Event do 
  it { should validate_presence_of(:day) }
  it { should validate_presence_of(:month) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:actor) }
  it { should validate_presence_of(:action) }

  describe "#full_description" do 
    it "should include the actor, action, day, month and year if no description" do 
      event = Fabricate(:event, description: nil)
      expect(event.full_description).to eq("#{event.actor} #{event.action} on #{event.month_word} #{event.day}, #{event.year}")
    end

    it "should include the actor, action, description, day, month and year if there is a description" do 
      event = Fabricate(:event, description: "tall")
      expect(event.full_description).to eq("#{event.actor} #{event.action} #{event.description} on #{event.month_word} #{event.day}, #{event.year}")
    end
  end

  describe "#wikipedia_url" do
    context "without description" do 
      let(:event) { Fabricate(:event, actor: "Jeb Bush", description: nil) }
      it "should replace spaces in the event's actor by underscores, downcase all letters and prefix it with 'https://en.wikipedia.org/wiki/' " do 
        expect(event.wikipedia_url).to eq("https://en.wikipedia.org/wiki/Jeb_Bush")
      end
    end

    context "with description" do 
      let(:event) { Fabricate(:event, actor: "Jeb Bush", description: "healthy and pretty") }
      it "should replace spaces with underscores, join the actor and description with '#' and prefix everything with 'https://en.wikipedia.org/wiki/' " do 
        expect(event.wikipedia_url).to eq("https://en.wikipedia.org/wiki/Jeb_Bush#healthy_and_pretty")
      end
    end
  end

  describe "#month_word" do 
    it "should return 'January' if the month is 1" do 
      event = Fabricate(:event, month: 1)
      expect(event.month_word).to eq("January")
    end

    it "should return 'February' if the month is 2" do 
      event = Fabricate(:event, month: 2)
      expect(event.month_word).to eq("February")
    end

    it "should return 'March' if the month is 3"do 
      event = Fabricate(:event, month: 3)
      expect(event.month_word).to eq("March")
    end

    it "should return 'April' if the month is 4" do 
      event = Fabricate(:event, month: 4)
      expect(event.month_word).to eq("April")
    end

    it "should return 'May' if the month is 5" do 
      event = Fabricate(:event, month: 5)
      expect(event.month_word).to eq("May")
    end

    it "should return 'June' if the month is 6" do 
      event = Fabricate(:event, month: 6)
      expect(event.month_word).to eq("June")
    end

    it "should return 'July' if the month is 7" do 
      event = Fabricate(:event, month: 7)
      expect(event.month_word).to eq("July")
    end

    it "should return 'August' if the month is 8" do 
      event = Fabricate(:event, month: 8)
      expect(event.month_word).to eq("August")
    end

    it "should return 'September' if the month is 9" do 
      event = Fabricate(:event, month: 9)
      expect(event.month_word).to eq("September")
    end

    it "should return 'October' if the month is 10" do 
      event = Fabricate(:event, month: 10)
      expect(event.month_word).to eq("October")
    end

    it "should return 'November' if the month is 11" do 
      event = Fabricate(:event, month: 11)
      expect(event.month_word).to eq("November")
    end 

    it "should return 'December' if the month is 12" do 
      event = Fabricate(:event, month: 12)
      expect(event.month_word).to eq("December")
    end

    it "should return the month's value if it isn't between 1 and 12" do 
      event = Fabricate(:event, month: 0)
      expect(event.month_word).to eq(event.month)
    end
  end
end