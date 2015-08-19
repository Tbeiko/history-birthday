class EventsController < ApplicationController

  def show
    @events = Event.where(day: params[:event][:day], month: params[:event][:month]) unless Event.all.empty?
    if [*@events].count > 1
      @event = @events.sample
    elsif [*@events].count == 1
        @event = @events.first
    else
      @event = nil
    end
  end
end