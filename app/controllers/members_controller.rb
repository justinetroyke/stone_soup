class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.create(member_params)
    if params[:commit] == 'Save and Add Another Member' && @member.save
      flash[:success] = "#{@member.name} added!"

      redirect_to new_member_path
    elsif params[:commit] == 'Create Member' && @member.save
      flash[:success] = "#{@member.name} added!"

      redirect_to members_path
    else
      flash[:error] = "Check all fields have been completed and try again!"

      redirect_to new_member_path
    end
  end

  private
    def member_params
      params.require(:member)
      .permit(
        :name,
        :type,
        :email
      )
    end
end
