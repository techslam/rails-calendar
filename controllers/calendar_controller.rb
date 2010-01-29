class CalendarController < ApplicationController

  def index    
    if params[:new_month].nil?
      @show_month = Date.today
    else
      d = params[:new_month].to_i
      passed_date = Date.parse(params[:passed_date])
      if params[:new_month].to_i > passed_date.month
        @show_month  = passed_date+1.month
      else
        @show_month = passed_date-1.month
      end      
    end    
    @start_date = Date.parse "#{@show_month.year}-#{@show_month.month}-01"
    @start_date_day = @start_date.wday
    @last_day = (@start_date >> 1)-1
  end

  def new_calendar
    d = params[:new_month].to_i
    passed_date = Date.parse(params[:passed_date])
    if params[:new_month].to_i > passed_date.month
      @show_month  = passed_date+1.month
    else
      @show_month = passed_date-1.month
    end
    @start_date = Date.parse "#{@show_month.year}-#{@show_month.month}-01"
    @start_date_day = @start_date.wday
    @last_day = (@start_date >> 1)-1
    render :update do |page|
      page.replace_html 'calendar', :partial => 'month',:object => @show_month
    end
  end

  def quote
    @day = params[:day]
    @month = params[:month]
    render :text=> @day+" "+@month
  end

end
