class BookingsController < ApplicationController

def index
  @bookings = policy_scope(Booking).order(created_at: :desc)
  authorize @booking
end

def show
  @booking = Booking.find(params[:id])
  authorize @booking
end

def new
  @tool = Tool.find(params[:tool_id])
  @booking = Booking.new
  authorize @booking
end

def create
  @tool = Tool.find(params[:tool_id])
  @booking = Booking.new(booking_params)
  @booking.user = current_user
  @booking.tool = @tool
  @booking.status = "pending validation"
  @booking.total_price = (@booking.date_end - @booking.date_begin) * @tool.daily_price
  authorize @booking
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
