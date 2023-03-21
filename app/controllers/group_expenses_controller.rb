class GroupExpensesController < ApplicationController
  before_action :set_group_expense, only: %i[ show edit update destroy ]

  # GET /group_expenses or /group_expenses.json
  def index
    @group_expenses = GroupExpense.all
  end

  # GET /group_expenses/1 or /group_expenses/1.json
  def show
  end

  # GET /group_expenses/new
  def new
    @group_expense = GroupExpense.new
  end

  # GET /group_expenses/1/edit
  def edit
  end

  # POST /group_expenses or /group_expenses.json
  def create
    @group_expense = GroupExpense.new(group_expense_params)

    respond_to do |format|
      if @group_expense.save
        format.html { redirect_to group_expense_url(@group_expense), notice: "Group expense was successfully created." }
        format.json { render :show, status: :created, location: @group_expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_expenses/1 or /group_expenses/1.json
  def update
    respond_to do |format|
      if @group_expense.update(group_expense_params)
        format.html { redirect_to group_expense_url(@group_expense), notice: "Group expense was successfully updated." }
        format.json { render :show, status: :ok, location: @group_expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_expenses/1 or /group_expenses/1.json
  def destroy
    @group_expense.destroy

    respond_to do |format|
      format.html { redirect_to group_expenses_url, notice: "Group expense was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_expense
      @group_expense = GroupExpense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_expense_params
      params.fetch(:group_expense, {})
    end
end
