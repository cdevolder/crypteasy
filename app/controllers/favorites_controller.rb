require 'cryptocompare'

class FavoritesController < ApplicationController
  def index


  end

  def show
    @favorite = Favorite.find(params[:id])

  end

  def new
    @favorite = Favorite.new
  end


# create ok !
  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.crypto = Crypto.find(params.require(:favorite)["crypto_id"][1].to_i)
    @favorite.platform = Platform.find(params.require(:favorite)["platform_id"][1].to_i)
    @favorite.save
    if @favorite.save
      redirect_to  favorites_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end



  def favorite_params
    params.require(:favorite).permit(:crypto_id, :platform_id)
  end


end
