class ExchangeValueJob < ApplicationJob
  queue_as :default

  def perform
    platforms = Platform.all

    platforms.each do |platform|
      platform.cryptos.each do |crypto|
        ExchangeValueService.new(crypto.accronym, platform.name).call
      end
    end
  end
end
