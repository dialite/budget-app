class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  # GET /group_expenses or /group_expenses.json
  def index
    redirect_to groups_path if user_signed_in?
  end
end
