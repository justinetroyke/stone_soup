class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_member
  helper_method :current_leader?

  def current_member
    @current_member = nil
    if session[:member_id]
      @current_member ||= Member.find(session[:member_id])
    end
  end

  def current_leader?
    current_member && current_member.leader?
  end
end
