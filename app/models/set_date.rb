class SetDate < ActiveRecord::Base
  validates_presence_of :day, :month, :year
end