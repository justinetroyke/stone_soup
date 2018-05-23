class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      flash[:success] = "#{@group.title} added!"

      redirect_to groups_path
    else
      flash[:error] = "Please complete all fields"

      redirect_to new_group_path
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    valid_group = @group.update(group_params)
    if params[:group][:group_members].nil? && valid_group

      redirect_to group_path(@group)
    elsif valid_group
      GroupMemberCreator.new(group_id: params[:id], member_id: group_member_params[:member_id])

      redirect_to group_path(@group)
    else
      render 'Edit'
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy

    flash[:success] = "#{group.title} was successfully deleted!"
    redirect_to groups_path
  end

  private
    def group_params
      params.require(:group).permit(:title, :start, :recipe_id)
    end

    def group_member_params
      params.require(:group).require(:group_members)
      .permit(
        :group_id,
        :member_id
      )
    end
end
