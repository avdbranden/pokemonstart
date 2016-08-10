class RequestsController < ApplicationController
  before_action :set_user
  before_action :set_data_journal

  def create
    @request = Request.new(request_params)
    @request.data_journal_id = @data_journal.id
    if @request.save
      flash[:notice] = "Your request will be handled shortly"
      redirect_to user_data_journals_path(@user)
    else
      render "users/#{@user.id}/data_journals"
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_data_journal
    @data_journal = DataJournal.find(params[:data_journal_id])
  end

  def request_params
    params.require(:request).permit(:nature, :content)
  end
end
