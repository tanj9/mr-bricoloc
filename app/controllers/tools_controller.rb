class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    @tools = policy_scope(Tool).order(created_at: :desc)
  end

  def show
    @tool = Tool.find(params[:id])
    authorize @tool
    @booking = Booking.new
    authorize @booking
  end

  def new
    @tool = Tool.new
    authorize @tool
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    authorize @tool
    if @tool.save!
      redirect_to tools_path
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
end
