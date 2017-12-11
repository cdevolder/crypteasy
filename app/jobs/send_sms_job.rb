class SendSmsJob < ApplicationJob
  queue_as :default

  def perform

    @allvalue = Exchangetimevalue.where("platform_id = '1' AND crypto_id = '1'").last
      @value = @allvalue["euro"]
    @allvalue1 = Exchangetimevalue.where("platform_id = '1' AND crypto_id = '3'").last
      @value1 = @allvalue1["euro"]
    @allvalue2 = Exchangetimevalue.where("platform_id = '1' AND crypto_id = '2'").last
      @value2 = @allvalue2["euro"]
    @allvalue3 = Exchangetimevalue.where("platform_id = '2' AND crypto_id = '1'").last
      @value3 = @allvalue3["euro"]
    @allvalue4 = Exchangetimevalue.where("platform_id = '2' AND crypto_id = '3'").last
      @value4 = @allvalue4["euro"]
    @allvalue5 = Exchangetimevalue.where("platform_id = '2' AND crypto_id = '2'").last
      @value5 = @allvalue5["euro"]
    @allvalue6 = Exchangetimevalue.where("platform_id = '3' AND crypto_id = '1'").last
      @value6 = @allvalue6["euro"]
    @allvalue7 = Exchangetimevalue.where("platform_id = '3' AND crypto_id = '3'").last
      @value7 = @allvalue7["euro"]
    @allvalue8 = Exchangetimevalue.where("platform_id = '3' AND crypto_id = '2'").last
      @value8 = @allvalue8["euro"]

    @alertsup = []
    @alertinf = []
    Alert.find_each do |alert|
      if alert.option == "Superieur"
        @alertsup << alert
      elsif alert.option == "Inferieur"
        @alertinf << alert
      end
    end

    @alertsup.each do |alert|
      if alert.favorite.crypto.accronym == "BTC"
        if Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Kraken"
          if @value >= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Bitcoin a dépassé les #{alert.price}€ sur la plateforme Kraken."
            SendSmsService.new(@phone, @body).send
          end
        elsif Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Gdax"
          if @value3 >= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Bitcoin a dépassé les #{alert.price}€ sur la plateforme Gdax."
            SendSmsService.new(@phone, @body).send
          end
        elsif Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Bitstamp"
          if @value6 >= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Bitcoin a dépassé les #{alert.price}€ sur la plateforme Bitstamp."
            SendSmsService.new(@phone, @body).send
          end
        end
      elsif alert.favorite.crypto.accronym == "ETH"
        if Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Kraken"
          if @value2 >= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Ethereum a dépassé les #{alert.price}€ sur la plateforme Kraken."
            SendSmsService.new(@phone, @body).send
          end
        elsif Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Gdax"
          if @value5 >= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Ethereum a dépassé les #{alert.price}€ sur la plateforme Gdax."
            SendSmsService.new(@phone, @body).send
          end
        elsif Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Bitstamp"
          if @value8 >= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Ethereum a dépassé les #{alert.price}€ sur la plateforme Bitstamp."
            SendSmsService.new(@phone, @body).send
          end
        end
      elsif alert.favorite.crypto.accronym == "LTC"
        if Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Kraken"
          if @value1 >= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Litcoin a dépassé les #{alert.price}€ sur la plateforme Kraken."
            SendSmsService.new(@phone, @body).send
          end
        elsif Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Gdax"
          if @value4 >= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Litcoin a dépassé les #{alert.price}€ sur la plateforme Gdax."
            SendSmsService.new(@phone, @body).send
          end
        elsif Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Bitstamp"
          if @value7 >= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Litcoin a dépassé les #{alert.price}€ sur la plateforme Bitstamp."
            SendSmsService.new(@phone, @body).send
          end
        end
      end
    end

    @alertinf.each do |alert|
      if alert.favorite.crypto.accronym == "BTC"
        if Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Kraken"
          if @value <= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Bitcoin est passé sous les #{alert.price}€ sur la plateforme Kraken."
            SendSmsService.new(@phone, @body).send
          end
        elsif Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Gdax"
          if @value3 <= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Bitcoin est passé sous les #{alert.price}€ sur la plateforme Gdax."
            SendSmsService.new(@phone, @body).send
          end
        elsif Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Bitstamp"
          if @value6 <= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Bitcoin est passé sous les #{alert.price}€ sur la plateforme Bitstamp."
            SendSmsService.new(@phone, @body).send
          end
        end
      elsif alert.favorite.crypto.accronym == "ETH"
        if Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Kraken"
          if @value2 <= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Ethereum est passé sous les #{alert.price}€ sur la plateforme Kraken."
            SendSmsService.new(@phone, @body).send
          end
        elsif Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Gdax"
          if @value5 <= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Ethereum est passé sous les #{alert.price}€ sur la plateforme Gdax."
            SendSmsService.new(@phone, @body).send
          end
        elsif Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Bitstamp"
          if @value8 <= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Ethereum est passé sous les #{alert.price}€ sur la plateforme Bitstamp."
            SendSmsService.new(@phone, @body).send
          end
        end
      elsif alert.favorite.crypto.accronym == "LTC"
        if Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Kraken"
          if @value1 <= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Litcoin est passé sous les #{alert.price}€ sur la plateforme Kraken."
            SendSmsService.new(@phone, @body).send
          end
        elsif Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Gdax"
          if @value4 <= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Litcoin est passé sous les #{alert.price}€ sur la plateforme Gdax."
            SendSmsService.new(@phone, @body).send
          end
        elsif Platform.find(alert.favorite.platform1).name || Platform.find(alert.favorite.platform2).name == "Bitstamp"
          if @value7 <= alert.price.to_i
            @phone = alert.user.phone
            @body = "Le Litcoin est passé sous les #{alert.price}€ sur la plateforme Bitstamp."
            SendSmsService.new(@phone, @body).send
          end
        end
      end
    end
  end

end
