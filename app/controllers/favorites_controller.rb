require 'cryptocompare'

class FavoritesController < ApplicationController
  def index
    @x = current_user.id
    sql = "select * from favorites WHERE user_id = #{@x}"
    @favorites = ActiveRecord::Base.connection.execute(sql).values # each favorite of current user
    @platformname = []
    @favorites.each do |favorit|
      sql1 = "select * from exchangetimevalues WHERE crypto_id = #{favorit[1]} AND platform_id = #{favorit[2]}"
      @valuecryp = ActiveRecord::Base.connection.execute(sql1).values # select the exchangetimevalues for a specific platform/crypto
      xxx = @valuecryp[0][1]
      @platformname << [Crypto.find(favorit[1]).name, Platform.find(favorit[2]).name, xxx] #compute the crypto name and and platform name and the value in euro in an array for each favorites
    end
  end

  def show

  end

  def new
     @favorite = Favorite.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
