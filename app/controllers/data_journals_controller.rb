class DataJournalsController < ApplicationController
  before_action :set_data_journal, only: %i(index)

  def index
    # If a data_journal is in DB, show it, otherwise, create one
    @data_journal.exists? ? @data_journal : create
    @attributes = filter_attributes
    # raise
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

  def filter_attributes
    # Remove undesired elements from user model
    # Retain personal data
    current_user.attributes.slice!(
      "id", "encrypted_password", "reset_password_token",
      "reset_password_sent_at","remember_created_at", "sign_in_count",
      "current_sign_in_at", "last_sign_in_at", "current_sign_in_ip",
      "last_sign_in_ip", "created_at","updated_at", "admin"
    # Remove personal data not filled out by user
      ).delete_if { |type, data| data.blank? }
  end
end
