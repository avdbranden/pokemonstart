class UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    @user.update(user_params)
    @user.save
    redirect_to pokemons_path
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birth_date,
      :address, :phone_number, :occupation, :email)
  end
end
