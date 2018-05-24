class Leader::MembersController < Leader::BaseController
  def show
    @leader = Member.find(params[:id])
  end

  def destroy
    Member.destroy(params[:id])

    redirect_to members_path
  end
end
