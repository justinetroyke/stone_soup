class MembersController < ApplicationController
  def index
    render 404 unless current_leader?
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
    if params[:commit] == 'Create Account' && @member.save
      session[:member_id] = @member.id
      flash[:success] = "Welcome, #{@member.name}!"

      redirect_to member_path(@member)
    else
      flash[:error] = 'Registration fail, Please try again!'

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

   # def destroy
   #   member = Member.find(params[:id])
   #   member.destroy
   #
   #   flash[:success] = "#{member.name} was successfully deleted!"
   #   redirect_to members_path
   # end

private
  def member_params
    params.require(:member)
    .permit(
      :name,
      :username,
      :password,
      :role,
      :email,
      :ingredient_id
    )
  end
end
