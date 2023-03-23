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
    @group = Group.new(group_params)
    @group.user = @user
    if @group.save
      redirect_to group_path(id: @group.id), notice: 'Group was successfully created.'
    else
      flash.now[:alert] = @group.errors.full_messages.first if @group.errors.any?
      render :new, status: 400
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    if @group.update(group_params)
      redirect_to group_path(id: @group.id), notice: 'Group was successfully updated.'
    else
      flash.now[:alert] = @group.errors.full_messages.first if @group.errors.any?
      render :edit, status: 400
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    if @group.destroy
      redirect_to group_path, notice: 'Group was successfully deleted.'
    else
      flash.now[:alert] = @group.errors.full_messages.first if @group.errors.any?
      render :index, status: 400
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
