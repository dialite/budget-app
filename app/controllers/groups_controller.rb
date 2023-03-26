class GroupsController < ApplicationController
  before_action :find_user
  before_action :set_group, only: %i[show edit update destroy]

  # GET /groups or /groups.json
  def index
    @groups = @user.groups.all
  end

  # GET /groups/1 or /groups/1.json
  def shows; end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
    @group = @user.groups.build(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      flash.now[:alert] = @group.errors.full_messages.first if @group.errors.any?
      render :new, status: :bad_request
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      flash.now[:alert] = @group.errors.full_messages.first if @group.errors.any?
      render :edit, status: :bad_request
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    if can? :edit, @group
      GroupExpense.where(group_id: @group.id).each do |group_expense|
        expense = group_expense.expense
        group_expense.destroy
        expense.destroy
      end

      if @group.destroy
        redirect_to groups_path, notice: 'Group was successfully deleted'
      else
        flash.now[:alert] = @group.errors.full_messages.first if @group.errors.any?
        render :index, status: :bad_request
      end
    else
      flash[:alert] = 'Unauthorized'
      redirect_to groups_path
    end
  end

  private

  def find_user
    @user = current_user
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find_by_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
