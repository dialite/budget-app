class ExpensesController < ApplicationController
  load_and_authorize_resource
  before_action :find_user
  before_action :find_group
  before_action :find_group_expenses

  # GET /expenses or /expenses.json
  def index
    authorize! :manage, @group
  end

  # GET /expenses/1 or /expenses/1.json
  def show
    @expense = Expense.find(params[:id])
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.find(params[:id])
  end

  # POST /expenses or /expenses.json
  def create
    @expense = Expense.new(expense_params)
    @expense.user = @user
    if @expense.save
      GroupExpense.create(group_id: @group.id, expense_id: @expense.id)
      redirect_to group_expenses_path(group_id: @group.id), notice: 'Expense was successfully created.'
    else
      flash.now[:alert] = @expense.errors.full_messgaes.first if @expense.errors.any?
      render :new, status: 400
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    if @expense.update(expense_params)
      redirect_to group_expense_path(group_id: @group.id, id: @expense.id), notice: 'Expense was successfully updated.'
    else
      flash.now[:alert] = @expense.errors.full_messages.first if @expense.errors.any?
      render :edit, status: :bad_request
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    if can? :edit, @expense
      @group_expenses = @expense.group_expenses
      @group_expenses.destroy_all
      if @expense.destroy
        redirect_to group_expenses_path(group_id: @group.id, id: @expense.id), notice: 'Expense was successfully destroyed.'
      else
        flash.now[:alert] = @expense.errors.full_messages.first if @expense.errors.any?
        render :index, status: :bad_request
      end
    else
      flash[:alert] = 'You are not authorized'
      redirect_to groups_path
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def find_user
    @user = current_user
  end

  def find_group
    @group = Group.find_by_id(params[:group_id])
  end

  def find_group_expenses
    @group_expenses = GroupExpense.where({ group_id: params[:group_id] }).order(created_at: :desc)
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :icon)
  end
end
