require 'cryptocompare'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @favorites = current_user.favorites
    @minmax = []
    @platname = []
    if (@favorites.size >= 1)
      @crypto0 = @favorites[0].crypto_id
      @platform0a = @favorites[0].platform1
      @platform0b = @favorites[0].platform2
      @platname << [Platform.find(@favorites[0].platform1).name, Platform.find(@favorites[0].platform2).name]
      @alltimevalues0a = []
      @alltimevalues0b = []
      @timevalues0a =  Exchangetimevalue.where("platform_id = '#{@platform0a}' AND crypto_id = '#{@crypto0}'").last(300)
      @timevalues0b =  Exchangetimevalue.where("platform_id = '#{@platform0b}' AND crypto_id = '#{@crypto0}'").last(300)
      @min0a = @timevalues0a[0].euro.to_f
      @max0a = @timevalues0a[0].euro.to_f

      @timevalues0a.each_with_index do |timeval, ind|
        @alltimevalues0a << [timeval.created_at.to_time.to_i * 1000,timeval.euro]
        if timeval.euro < @min0a
          @min0a = timeval.euro.to_f
        end
        if timeval.euro > @max0a
          @max0a = timeval.euro.to_f
        end
      end

      @timevalues0b.each_with_index do |timeval, ind|
        @alltimevalues0b << [timeval.created_at.to_time.to_i * 1000,timeval.euro]
      end

      @minmax << [@min0a, @max0a]
    end
    if (@favorites.size >= 2)
      @crypto1 = @favorites[1].crypto_id
      @platform1a = @favorites[1].platform1
      @platform1b = @favorites[1].platform2
      @platname << [Platform.find(@favorites[1].platform1).name, Platform.find(@favorites[1].platform2).name]
      @alltimevalues1a = []
      @alltimevalues1b = []
      @timevalues1a =  Exchangetimevalue.where("platform_id = '#{@platform1a}' AND crypto_id = '#{@crypto1}'").last(300)
      @timevalues1b =  Exchangetimevalue.where("platform_id = '#{@platform1b}' AND crypto_id = '#{@crypto1}'").last(300)
      @min1a = @timevalues1a[0].euro.to_f
      @max1a = @timevalues1a[0].euro.to_f

      @timevalues1a.each_with_index do |timeval, ind|
        @alltimevalues1a << [timeval.created_at.to_time.to_i * 1000,timeval.euro]
        if timeval.euro < @min1a
          @min1a = timeval.euro.to_f
        end
        if timeval.euro > @max1a
          @max1a = timeval.euro.to_f
        end
      end

      @timevalues1b.each_with_index do |timeval, ind|
        @alltimevalues1b << [timeval.created_at.to_time.to_i * 1000,timeval.euro]
      end

      @minmax << [@min1a, @max1a]
    end

    if (@favorites.size >= 3)
      @crypto2 = @favorites[2].crypto_id
      @platform2a = @favorites[2].platform1
      @platform2b = @favorites[2].platform2
      @platname << [Platform.find(@favorites[2].platform1).name, Platform.find(@favorites[2].platform2).name]
      @alltimevalues2a = []
      @alltimevalues2b = []
      @timevalues2a =  Exchangetimevalue.where("platform_id = '#{@platform2a}' AND crypto_id = '#{@crypto2}'").last(300)
      @timevalues2b =  Exchangetimevalue.where("platform_id = '#{@platform2b}' AND crypto_id = '#{@crypto2}'").last(300)
      @min2a = @timevalues2a[0].euro.to_f
      @max2a = @timevalues2a[0].euro.to_f

      @timevalues2a.each_with_index do |timeval, ind|
        @alltimevalues2a << [timeval.created_at.to_time.to_i * 1000,timeval.euro]
        if timeval.euro < @min2a
          @min2a = timeval.euro.to_f
        end
        if timeval.euro > @max2a
          @max2a = timeval.euro.to_f
        end
      end

      @timevalues2b.each_with_index do |timeval, ind|
        @alltimevalues2b << [timeval.created_at.to_time.to_i * 1000,timeval.euro]
      end

      @minmax << [@min2a, @max2a]
    end
      @allplatcompact = []
      if (@favorites.size >= 1)
        @allplatcompact << [@alltimevalues0a,@alltimevalues0b]
      end
      if (@favorites.size >= 2)
      @allplatcompact << [@alltimevalues1a,@alltimevalues1b]
      end
      if (@favorites.size >= 3)
      @allplatcompact << [@alltimevalues2a,@alltimevalues2b]
      end

  end
end
