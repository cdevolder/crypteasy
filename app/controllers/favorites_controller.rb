require 'cryptocompare'

class FavoritesController < ApplicationController
  def index
  end

  def show
    @favorite = Favorite.find(params[:id])
    @timevalues1 = Exchangetimevalue.where("platform_id = '#{@favorite.platform1}' AND crypto_id = '#{@favorite.crypto_id}'")
    @timevalues2 = Exchangetimevalue.where("platform_id = '#{@favorite.platform2}' AND crypto_id = '#{@favorite.crypto_id}'")
    @alltimevalues1 = []
    @alltimevalues2 = []
    @min1 = @timevalues1[0].euro.to_f
    @max1 = @timevalues1[0].euro.to_f
    @min2 = @timevalues2[0].euro.to_f
    @max1 = @timevalues2[0].euro.to_f
    @timevalues1.each_with_index do |timeval, ind|
      @alltimevalues1 << [timeval.created_at.to_time.to_i,timeval.euro]
      if timeval.euro < @min1
        @min1 = timeval.euro.to_f
      end
      if timeval.euro > @max1
        @max1 = timeval.euro.to_f
      end
    end
    @timevalues2.each_with_index do |timeval, ind|
      @alltimevalues2 << [timeval.created_at.to_time.to_i,timeval.euro]
      if timeval.euro < @min2
        @min2 = timeval.euro.to_f
      end
      if timeval.euro > @max2
        @max2 = timeval.euro.to_f
      end
    end
  end

  def new
    @favorite = Favorite.new
    @allcrypto = []
    Crypto.all.each do |crypto|
      array = [crypto.name, crypto.id]
      @allcrypto << array
    end
    @allplatform = []
    Platform.all.each do |platform|
      array = [platform.name, platform.id]
      @allplatform << array
    end
  end


# create ok !
  def create
    @favorite = Favorite.new#( user: current_user, crypto: Crypto.find(favorite_params["crypto_id"][1].to_i), platform1: favorite_params["platform1"][1].to_i, platform2: favorite_params["platform2"][1].to_i )
    @favorite.user = current_user
    @favorite.crypto = Crypto.find(favorite_params["crypto_id"].to_i)
    @favorite.platform1 = favorite_params["platform1"].to_i
    @favorite.platform2 = favorite_params["platform2"].to_i
    @favorite.save

    if @favorite.save
      redirect_to  dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to  dashboard_path
  end



  def favorite_params
    params.require(:favorite).permit(:crypto_id, :platform1, :platform2)
  end


end
