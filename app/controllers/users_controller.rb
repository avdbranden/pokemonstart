class UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    # If upload json, i.e. params file present, parse JSON and update user
    if params[:user][:file]
      file = File.open(params[:user][:file].tempfile, "r")
      json_data = JSON.parse(file.read)
      permitted_json_params = filter_json(json_data["data_sets"])
      @user.update(permitted_json_params)
      @user.save
      file.close
      redirect_to user_data_journals_path(@user)
    # Else, i.e. upload via form, update user via strong params
    else
      @user.update(user_params)
      @user.save
      redirect_to pokemons_path
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
    # Keep only json data corresponding to fields
    h.select do |k,v|
      ["first_name", "last_name",
      "birth_date", "address", "phone_number",
      "occupation", "email"].include?(k)
    end
  end
end
