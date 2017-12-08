require 'cryptocompare'

class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where("user_id = current_user")
  end

  end

  def show
    @favorite = Favorite.find(params[:id])


    @timevalues = Exchangetimevalue.where("platform_id = '3' AND crypto_id = '1'")
    @timevalues1 = Exchangetimevalue.where("platform_id = '2' AND crypto_id = '1'")
    @alltimevalues = []
    @min = @timevalues[0].euro.to_f
    @max = @timevalues[0].euro.to_f
    @timevalues.each_with_index do |timeval, ind|
      @alltimevalues << [timeval.created_at.to_time.to_i,timeval.euro]
      # @alltimevalues << [ind+1,timeval.euro]
      if timeval.euro < @min
        @min = timeval.euro.to_f
      end
      if timeval.euro > @max
        @max = timeval.euro.to_f
      end
      @min = @min
      @max = @max


  def show
    @favorite = Favorite.find(params[:id])
    @timevalues = Exchangetimevalue.where("platform_id = '#{@favorite.platform_id}' AND crypto_id = '#{@favorite.crypto_id}'")
    @alltimevalues = []
    @min = @timevalues[0].euro.to_f
    @max = @timevalues[0].euro.to_f
    @timevalues.each_with_index do |timeval, ind|
      @alltimevalues << [timeval.created_at.to_time.to_i,timeval.euro]
      if timeval.euro < @min
        @min = timeval.euro.to_f
      end
      if timeval.euro > @max
        @max = timeval.euro.to_f
      end
    end
  end

  def new
    @favorite = Favorite.new
  end


# create ok !
  def create
    @favorite = Favorite.new#( user: current_user, crypto: Crypto.find(favorite_params["crypto_id"][1].to_i), platform1: favorite_params["platform1"][1].to_i, platform2: favorite_params["platform2"][1].to_i )
    @favorite.user = current_user
    @favorite.crypto = Crypto.find(favorite_params["crypto_id"][1].to_i)
    @favorite.platform1 = favorite_params["platform1"][1].to_i
    @favorite.platform2 = favorite_params["platform2"][1].to_i
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
    @favorite.destroy
  end



  def favorite_params
    params.require(:favorite).permit(crypto_id: [], platform1: [], platform2: [])
  end


end
