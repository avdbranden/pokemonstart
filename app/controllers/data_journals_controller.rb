class DataJournalsController < ApplicationController

  def show
    @data_journal = DataJournal.where(user_id: params[:user_id])
  end
end
