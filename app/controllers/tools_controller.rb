class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
    authorize @tool
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
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
