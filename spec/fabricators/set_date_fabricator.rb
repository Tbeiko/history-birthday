Fabricator(:set_date) do 
  day   { Faker::Number.between(1, 28) }
  month { Faker::Number.between(1, 12) }
  year  { Faker::Number.between(1900, 2015) }
end