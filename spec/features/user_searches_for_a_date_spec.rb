require 'spec_helper'

feature "user searches for a date" do 
  scenario "user searches for a valid date and there is an event" do 
    event = Fabricate(:event, day: 01, month: 01)
    fill_in_search_form_with(event.day, event.month, 1994)
    expect(page).to have_content(event.actor)
  end

  scenario "user searches for a valid date and there is no event" do 
    fill_in_search_form_with(01, 01, 1993)
    expect(page).to have_content("We can't think of")
  end
  
  scenario "user searches for an invalid date"
  
  def fill_in_search_form_with(day, month, year)
    visit root_path
    fill_in :day,   with: day
    fill_in :month, with: month
    fill_in :year,  with: year
    click_button "Submit"
  end
end