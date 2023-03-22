class HomeController < ApplicationController
  before_action :set_group_expense, only: %i[show edit update destroy]

  # GET /group_expenses or /group_expenses.json
  def index; end
end
