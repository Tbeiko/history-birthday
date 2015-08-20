module ApplicationHelper
  def blank_params?
    params[:day].empty? && params[:month].empty?
  end
end
