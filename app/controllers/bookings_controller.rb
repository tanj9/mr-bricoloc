class BookingsController < ApplicationController

def index
  @bookings = Booking.all
end

def show
  @booking = Booking.find(params[:id])
end

def new
  @tool = Tool.find(params[:tool_id])
  @booking = Booking.new
end

def create
  @tool = Tool.find(params[:tool_id])
  @booking = Booking.new(booking_params)
  @booking.user = current_user
  @booking.tool = @tool
  @booking.status = "pending validation"
  if @booking.save
    redirect_to bookings_path
  else
    render 'new'
  end
end

def edit
  @booking = Booking.find(params[:id])
end

#def update
#  @tool = Tool.find(params[:id])
#  @booking = Booking.find(params[:booking_id])
#  @booking.user = current_user
#  @booking.tool = @tool
#end

private

def booking_params
params.require(:booking).permit(:date_begin, :date_end)
end
end
