class Leader::MembersController < Leader::BaseController
  def index
  end
  def show
    @leader = Member.find(params[:id])
  end
end
