class EventsController < ApplicationController

  def index
    if invalid_input?
      @invalid = true 
      flash[:danger] = "Something was wrong with the date you entered. Please try again."
    else
      @events  = Event.where(day: params[:day], month: params[:month]) unless Event.all.empty?
      if [*@events].count > 1
        @event = @events.sample
      elsif [*@events].count == 1
        @event = @events.first
      else
        @event = nil
      end
    end
  end

  private 

  def invalid_input?
    if    params[:day].blank? || params[:month].blank?
      true
    elsif (params[:day].to_i < 1)|| (params[:month].to_i < 1 )
      true
    elsif params[:day].to_i   > 31
      true
    elsif params[:month].to_i > 12
      true
    elsif params[:year].to_i  > 2100
      true
    elsif params[:day].to_i == 31 && params[:month].to_i.in?([4, 6, 9, 11]) 
      true
    elsif params[:day].to_i >  29 && params[:month].to_i == 2
      true
    elsif params[:day].to_i >  28 && params[:month].to_i == 2 && !(params[:year].to_i % 4 == 0)
      true
    else
      false
    end
  end
end