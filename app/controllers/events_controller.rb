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
    negative_days? || negative_months? || numbers_too_high? || day_is_higher_than_days_in_month?
  end

  def negative_days?
    !params[:day].nil? && (params[:day].to_i < 1)
  end

  def negative_months?
    !params[:month].nil? && (params[:month].to_i < 1 )
  end

  def numbers_too_high?
    (params[:day].to_i > 31) || (params[:month].to_i > 12) || (params[:year].to_i  > 2100)
  end

  def day_is_higher_than_days_in_month?
    if    params[:day].to_i == 31 && params[:month].to_i.in?([4, 6, 9, 11]) 
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