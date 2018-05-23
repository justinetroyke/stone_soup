class SessionsController < ApplicationController
  def new
  end

  def create
    member = Member.find_by(username: params[:username])
    if member && member.authenticate(params[:password])
      session[:member_id] = member.id
      flash[:success] = "#Welcome, {current_member.name}"

      redirect_to member_path(member)
    else
      render :new
    end
  end

  def destroy
    session[:member_id] = nil
    redirect_to root_path
  end
end
