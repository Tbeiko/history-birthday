def fill_in_search_form_with(day, month, year)
  visit root_path
  fill_in :day,   with: day
  fill_in :month, with: month
  fill_in :year,  with: year
  click_button "Submit"
end