class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]

  def index
    # @bookings = policy_scope(Booking).order(created_at: :desc)
    skip_policy_scope
    @owner_bookings = Booking.joins(:tool).where(tool: { user: current_user })
    @user_bookings = Booking.where(user: current_user)
    @owner_tools = Tool.where(user: current_user).order(created_at: :desc)
  end

  def show
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
    @booking.status = "pending"
    @booking.total_price = (@booking.date_end - @booking.date_begin) * @tool.daily_price
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render 'new'
    end
  end

  def edit
    @tool = @booking.tool
    authorize @booking
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render 'edit'
    end
  end

  def accept
    set_booking
    authorize @booking
    @booking.status = 'validated'
    if @booking.save
      redirect_to bookings_path
    else
      render 'new'
    end
  end

  def decline
    set_booking
    authorize @booking
    @booking.status = 'declined'
    if @booking.save
      redirect_to bookings_path
    else
      render 'new'
    end
  end

  def cancel
    set_booking
    authorize @booking
    @booking.status = 'cancelled'
    if @booking.save
      redirect_to bookings_path
    else
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_begin, :date_end, :status, :total_price)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
