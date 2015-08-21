require "spec_helper"

feature "user clicks show another" do 
  scenario "user clicks show me another" do 
    event1 = Fabricate(:event)
    event2 = Fabricate(:event, day: event1.day, month: event1.month)

    fill_in_search_form_with(event1.day, event1.month, event1.year)
    expect(page).to have_content(event1.day)

    click_link "Show me another"
    expect(page).to have_content(event2.day)
  end
end