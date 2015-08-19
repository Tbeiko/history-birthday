class EventsController < ApplicationController

  def index
    @events   = Event.where(day: params[:day], month: params[:month]) unless Event.all.empty?
    if [*@events].count > 1
      @event = @events.sample
    elsif [*@events].count == 1
      @event = @events.first
    else
      @event = nil
    end
  end
end