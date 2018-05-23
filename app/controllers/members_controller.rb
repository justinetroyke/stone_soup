class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.create(member_params)
    # if params[:commit] == 'Save and Add Another Member' && @member.save
    #   flash[:success] = "#{@member.name} added!"
    #
    #   redirect_to new_member_path
    if params[:commit] == 'Create Account' && @member.save
      flash[:success] = "Welcome, #{@member.name}"

      redirect_to member_path(@member)
    else
      flash[:error] = 'Check all fields have been completed and try again!'

      redirect_to new_member_path
    end
  end
   def edit
     @member = Member.find(params[:id])
   end

   def update
     @member = Member.find(params[:id])
     if @member.update(member_params)
       redirect_to members_path
     else
       render 'Edit'
     end
   end

   def destroy
     member = Member.find(params[:id])
     member.destroy

     flash[:success] = "#{member.name} was successfully deleted!"
     redirect_to members_path
   end

  private
    def member_params
      params.require(:member)
      .permit(
        :name,
        :username,
        :password,
        :role,
        :email
      )
    end
end
