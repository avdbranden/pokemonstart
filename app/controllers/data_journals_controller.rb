class DataJournalsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @data_journal = DataJournal.where(user_id: params[:user_id])
  end
end
