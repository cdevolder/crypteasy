require 'cryptocompare'

class CryptosController < ApplicationController
  def index

    @cryptos = Crypto.all
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
        @testouille = @timevalues[0].created_at.utc.to_i
        @test1 = @timevalues[0].created_at


  end

  def show
    @crypto = Crypto.find(params[:id])
    if params[:platform]
      @timevalues = Exchangetimevalue.where("platform_id = '#{params[:platform]}' AND crypto_id = '#{params[:id]}'")
    else
      @timevalues = Exchangetimevalue.where("platform_id = '1' AND crypto_id = '#{params[:id]}'")
    end
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
      @min = @min
      @max = @max
    end
  end
end
