class ApplicationController < ActionController::Base
  helper_method :current_member

  def current_member
    @current_member = nil
    if session[:member_id]
      @current_member ||= Member.find(session[:member_id])
    end
  end
end
