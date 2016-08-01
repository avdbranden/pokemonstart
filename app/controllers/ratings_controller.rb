class RatingsController < ApplicationController
  def create         # POST /ratings
    @rating = Rating.new(rating_params)
    @pokemon = Pokemon.find(params[:pokemon_id])
    @rating.pokemon = @pokemon
    if @rating.save
      redirect_to pokemon_path(@pokemon)
    else
      render "pokemons/show"
      @rating.errors.full_messages
    end
  end

  def update         # PATCH /ratings/:id
  end

  private

  def rating_params
    params.require(:rating).permit(:stars, :pokemon_id)
  end
end
