class DataJournalsController < ApplicationController
  before_action :set_data_journal, only: %i(index update)


  # Custom helper to enable use of 'required' in data_journal view
  helper_method :required?

  def index             # GET users/:id/data_journals
    # If a data_journal is in DB, show it, otherwise, create one
    # Use 'first' when exists because @data_journal is a AR collection 'where
    @data_journal = @data_journal.exists? ? @data_journal.first : create
    @attributes = filter_attributes
  end

  def create            # POST users/:id/data_journals
    @data_journal = DataJournal.new(user_id: params[:user_id])
    if @data_journal.save
      @data_journal
    else
      redirect_to root_path
    end
  end

  def update           # PATCH users/:id/data_journals/:id
    # Check whether user has put valid password to confirm changes
    if current_user.valid_password?(params[:data_journal][:current_password])
      # Sort params whether data required/optional checked/unchecked
      @sorted_params = sort_params(data_journal_params)
      # If sorted_params contain a required data (eg: last_name)
      if @sorted_params.has_value?("destroy")
        # Destroy the current user
        return destroy_current_user
      # If all sorted_params are optional
      else
        # Update the user (data value replaced by 'nil' in database)
        current_user.update(@sorted_params)
        current_user.save
        flash[:notice] = "We will now stop processing the selected data"
        redirect_to user_data_journals_path(current_user)
      end
    else
      flash[:alert] = "Invalid password"
      redirect_to user_data_journals_path(current_user)
    end
  end

  # Custom method to check whether model attributes of instance presence: true
  # See http://stackoverflow.com/questions/7829996/rails-how-to-test-if-an-
  #attribute-of-a-class-object-is-required-in-the-model-po
  # http://apidock.com/rails/ActiveModel/Validations/ClassMethods/validators_on
  def required?(model, attr)
    model.validators_on(attr.to_sym).first.class == ActiveRecord::Validations::PresenceValidator
  end

  # required?(Class, :attribute)

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

  def data_journal_params
    # Strong params
    params.require(:data_journal).permit(:email, :first_name, :last_name, :address, :phone_number,
    :birth_date, :occupation)
  end

  def sort_params(data_journal_params)
    sorted_params = {}
    data_journal_params.each do |data, checked|
      # If the data required & checked not to be unprocessed
      # Change data by 'destroy' to tell controller to destroy
      if required?(User, data) && checked == "1"
        sorted_params[data] = "destroy"
      # If the data optional & checked not to be unprocessed
      # Change data by 'nil' to erase them from database
      elsif checked == "1"
        sorted_params[data] = nil
      else
      # Do nothing, as stripped from sorted_params hash
      end
    end
    sorted_params
  end

  def destroy_current_user
    # current_user.destroy # <-- Uncomment this to make it work
    flash[:alert] = "Your account has been deleted"
    flash[:notice] = "We will now stop processing your personal data"
    redirect_to root_path
  end
end
