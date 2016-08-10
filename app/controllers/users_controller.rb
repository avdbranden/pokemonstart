class UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    if params[:user] # <-- Check whether update
      if params[:user][:file] # <-- Check whether file uploaded from data_journal
        if params[:user][:file].content_type == "application/json" # <-- Check whether json file
          # Parse JSON
          file = File.open(params[:user][:file].tempfile, "r") # <-- open the file
          json_data = JSON.parse(file.read) # <-- parse the file opened and read
          # filter_json is custom method to enable parsing of json containing
          # other types of data than those present in user model
          permitted_json_params = filter_json(json_data["data_sets"])
          @user.update(permitted_json_params) # <-- update user with filtered params
          @user.save
          file.close # <-- closing the file
          flash[:notice] = "Thanks for the upload. Your user profile has been updated"
          redirect_to edit_user_path(@user)
        else
          flash[:alert] = "Wrong file format. Please upload a Json file"
          redirect_to user_data_journals_path(@user)
        end
      # Else, i.e. upload via form, update user via strong params
      else
        # Update user from edit trainer profile
        @user.update(user_params)
        @user.save
        flash[:notice] = "Your user profile has been updated"
        redirect_to edit_user_path(@user)
      end
    else # <-- Meaning no upload json and no edit trainer profile
      flash[:alert] = "No json file"
      redirect_to user_data_journals_path(@user)
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birth_date,
      :address, :phone_number, :occupation, :email)
  end

  def filter_json(h)
    # Keep only json data corresponding to fields present in user model
    # TODO: enrich method to parse nested json attributes
    h.select do |k,v|
      ["first_name", "last_name",
      "birth_date", "address", "phone_number",
      "occupation", "email"].include?(k)
    end
  end
end
