class ToolsController < ApplicationController

  def index
    @tools = policy_scope(Tool).order(created_at: :desc)
  end

  def show
    @tool = Tool.find(params[:id])
    authorize @tool
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

  private

  def tool_params
    params.require(:tool).permit(:name, :category, :description, :daily_price, :condition)
  end
end
