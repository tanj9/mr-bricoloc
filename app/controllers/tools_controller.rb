class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    skip_policy_scope
    @owner_tools = Tool.where(user: current_user).order(created_at: :desc)
    @search_params = {}
    if search_params.present?
      @search_params = search_params
      @tools = filter_tools
    else
      @tools = Tool.all
    end

    @markers = @tools.geocoded.map do |tool|
      {
        lat: tool.latitude,
        lng: tool.longitude,
        info_window: render_to_string(partial: "info_window", locals: { tool: tool })
      }
    end
  end

  def show
    @tool = Tool.find(params[:id])
    authorize @tool
    @booking = Booking.new
    # CALENDAR VIEW: Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    # For a monthly view:
    @meetings = Booking.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_year, status: "validated", tool: @tool)
  end

  def new
    @tool = Tool.new
    authorize @tool
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    @tool.address = "#{@tool.user.address}, #{@tool.user.city}"
    authorize @tool
    if @tool.save!
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
    authorize @tool
  end

  def update
    @tool = Tool.find(params[:id])
    authorize @tool
    @tool = Tool.update(tool_params)
  end

  def destroy
    @tool = Tool.find(params[:id])
    authorize @tool
    @tool.destroy
  end

  private

  def tool_params
    params.require(:tool).permit(
      :name,
      :category,
      :description,
      :daily_price,
      :condition,
      :photo
    )
  end

  def search_params
    if params[:search]
      params.require(:search).permit(
        :query,
        :max_price,
        :category,
        :distance
      )
    end
  end

  def filter_tools
    tools = Tool.where.not(user: current_user)
    tools = tools.where("name ILIKE ?", "%#{search_params[:query]}%") unless search_params[:query].blank?
    tools = tools.where("category ILIKE ?", "%#{search_params[:category]}%") unless search_params[:category].blank?
    tools = tools.where("daily_price < ?", search_params[:max_price]) unless search_params[:max_price].blank?
    user_address = "#{current_user.address}, #{current_user.city}"
    tools = tools.near(user_address, search_params[:distance]) unless search_params[:distance].blank?
    tools
  end
end
