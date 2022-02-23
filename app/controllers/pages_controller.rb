class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @tools = policy_scope(Tool).order(created_at: :desc).limit(6)
  end
end
