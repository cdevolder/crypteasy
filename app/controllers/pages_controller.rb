require 'cryptocompare'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  valuedispatch = Exchangetimevalue.last(1440*3)

   @minimum = valuedispatch[0].euro
   @maximum = valuedispatch[0].euro
   @minimum1 = valuedispatch[1].euro
   @maximum1 = valuedispatch[1].euro
   @minimum2 = valuedispatch[2].euro
   @maximum2 = valuedispatch[2].euro


  @valueplat1 = []

  @valueplat2 = []

  @valueplat3 = []

  valuedispatch.each do |value|
    if (value.platform_id == 2 && value.crypto_id == 1)
       @valueplat1 << [value.created_at.to_time.to_i * 1000,value.euro]
       if value.euro < @minimum
            @minimum = value.euro.to_f
       end
       if value.euro > @maximum
            @maximum = value.euro.to_f
       end
    end
    if (value.platform_id == 2 && value.crypto_id == 2)
       @valueplat2 << [value.created_at.to_time.to_i * 1000,value.euro]
       if value.euro < @minimum1
         @minimum1 = value.euro.to_f
       end
       if value.euro > @maximum1
         @maximum1 = value.euro.to_f
       end
    end
    if (value.platform_id == 2 && value.crypto_id == 3)
       @valueplat3 << [value.created_at.to_time.to_i * 1000,value.euro]
        if value.euro < @minimum2
          @minimum2 = value.euro.to_f
        end
        if value.euro > @maximum2
          @maximum2 = value.euro.to_f
        end
    end
  end
  end



  def dashboard
    @favorites = current_user.favorites
    @minmax = []
    @platname = []
    @cryptosname = []
    if (@favorites.size >= 1)
      @crypto0 = @favorites[0].crypto_id
      @platform0a = @favorites[0].platform1
      @platform0b = @favorites[0].platform2
      @platname << [Platform.find(@favorites[0].platform1).name, Platform.find(@favorites[0].platform2).name]
      @cryptosname << [Crypto.find(@favorites[0].crypto_id).name, Crypto.find(@favorites[0].crypto_id).accronym]
      @alltimevalues0a = []
      @alltimevalues0b = []
      @timevalues0a =  Exchangetimevalue.where("platform_id = '#{@platform0a}' AND crypto_id = '#{@crypto0}'").last(300)
      @timevalues0b =  Exchangetimevalue.where("platform_id = '#{@platform0b}' AND crypto_id = '#{@crypto0}'").last(300)
      @min0a = @timevalues0a[0].euro.to_f
      @max0a = @timevalues0a[0].euro.to_f
      @min0b = @timevalues0b[0].euro.to_f
      @max0b = @timevalues0b[0].euro.to_f

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
        if timeval.euro < @min0b
          @min0b = timeval.euro.to_f
        end
        if timeval.euro > @max0b
          @max0b = timeval.euro.to_f
        end
      end

      @minmax << [[@min0a,@min0b].min, [@max0a, @max0b].max]
    end
    if (@favorites.size >= 2)
      @crypto1 = @favorites[1].crypto_id
      @platform1a = @favorites[1].platform1
      @platform1b = @favorites[1].platform2
      @platname << [Platform.find(@favorites[1].platform1).name, Platform.find(@favorites[1].platform2).name]
      @cryptosname << [Crypto.find(@favorites[1].crypto_id).name, Crypto.find(@favorites[1].crypto_id).accronym]
      @alltimevalues1a = []
      @alltimevalues1b = []
      @timevalues1a =  Exchangetimevalue.where("platform_id = '#{@platform1a}' AND crypto_id = '#{@crypto1}'").last(300)
      @timevalues1b =  Exchangetimevalue.where("platform_id = '#{@platform1b}' AND crypto_id = '#{@crypto1}'").last(300)
      @min1a = @timevalues1a[0].euro.to_f
      @max1a = @timevalues1a[0].euro.to_f
      @min1b = @timevalues1b[0].euro.to_f
      @max1b = @timevalues1b[0].euro.to_f

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
        if timeval.euro < @min1b
          @min1b = timeval.euro.to_f
        end
        if timeval.euro > @max1b
          @max1b = timeval.euro.to_f
        end
      end

      @minmax << [[@min1a,@min1b].min, [@max1a, @max1b].max]
    end

    if (@favorites.size >= 3)
      @crypto2 = @favorites[2].crypto_id
      @platform2a = @favorites[2].platform1
      @platform2b = @favorites[2].platform2
      @platname << [Platform.find(@favorites[2].platform1).name, Platform.find(@favorites[2].platform2).name]
      @cryptosname << [Crypto.find(@favorites[2].crypto_id).name, Crypto.find(@favorites[2].crypto_id).accronym]
      @alltimevalues2a = []
      @alltimevalues2b = []
      @timevalues2a =  Exchangetimevalue.where("platform_id = '#{@platform2a}' AND crypto_id = '#{@crypto2}'").last(300)
      @timevalues2b =  Exchangetimevalue.where("platform_id = '#{@platform2b}' AND crypto_id = '#{@crypto2}'").last(300)
      @min2a = @timevalues2a[0].euro.to_f
      @max2a = @timevalues2a[0].euro.to_f
      @min2b = @timevalues2b[0].euro.to_f
      @max2b = @timevalues2b[0].euro.to_f

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
        if timeval.euro < @min2b
          @min2b = timeval.euro.to_f
        end
        if timeval.euro > @max2b
          @max2b = timeval.euro.to_f
        end
      end

      @minmax << [[@min2a,@min2b].min, [@max2a, @max2b].max]
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
