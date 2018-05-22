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
    if @group.save
      flash[:success] = "#{@group.title} updated!"

      redirect_to group_path(@group)
    else
      flash[:error] = "Please complete all fields"
      render 'Edit'
    end
  end

  private
    def group_params
      params.require(:group).permit(:title, :start)
    end
end
