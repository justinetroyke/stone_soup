class Leader::BaseController < ApplicationController
  before_action :require_leader, only: [:index, :show]

private

  def require_leader
    render file: '/public/404' unless current_leader?
  end
end
