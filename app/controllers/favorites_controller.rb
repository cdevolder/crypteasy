require 'cryptocompare'

class FavoritesController < ApplicationController
  def index
    @timevalues = Exchangetimevalue.where("platform_id = '3' AND crypto_id = '1'")
    @timevalues1 = Exchangetimevalue.where("platform_id = '2' AND crypto_id = '1'")
    @alltimevalues = []
    @alltimevalues1 = []
    @min = @timevalues[0].euro.to_f
    @max = @timevalues[0].euro.to_f
    @timevalues.each_with_index do |timeval, ind|
      @alltimevalues << [timeval.created_at.to_time.to_i,timeval.euro]
      @alltimevalues1 << [@timevalues1[ind].created_at.to_time.to_i, @timevalues1[ind].euro]
      # @alltimevalues << [ind+1,timeval.euro]
      if timeval.euro < @min
        @min = timeval.euro.to_f
      end
      if timeval.euro > @max
        @max = timeval.euro.to_f
      end
      @min = @min
      @max = @max

    end

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
    @favorite.destroy
    redirect_to
  end



  def favorite_params
    params.require(:favorite).permit(:crypto_id, :platform_id)
  end


end
