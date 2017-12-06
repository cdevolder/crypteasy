class ExchangeValueJob < ApplicationJob
  queue_as :default

  def perform
    Platform.find_each do |platform|
      Crypto.find_each do |crypto|
        ExchangeValueService.new(crypto, platform).call
      end
    end
  end
end
