class DataJournalsController < ApplicationController
  before_action :set_data_journal, only: %i(index)

  def index
    # If a data_journal is in DB, show it, otherwise, create one
    @data_journal.exists? ? @data_journal : create
  end

  def create
    @data_journal = DataJournal.new(user_id: params[:user_id])
    if @data_journal.save
      @data_journal
    else
      redirect_to root_path
    end
  end

  private

  def set_data_journal
    # Check if a data_journal exists for a given user_id
    @data_journal = DataJournal.where(user_id: params[:user_id])
  end
end
