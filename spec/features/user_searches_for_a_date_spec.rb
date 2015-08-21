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
  
  scenario "user searches for an invalid date" do 
    fill_in_search_form_with(0, 0, 10000)
    expect(page).to have_content("Something was wrong with the date you entered.")
  end
end