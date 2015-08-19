class Event < ActiveRecord::Base
  validates_presence_of :day, :month, :year, :actor, :action
end