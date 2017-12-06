class ExchangeValueService

  def initialize(crypto, platform)
    @platform = platform
    @crypto = crypto
  end

  def call
    puts "[ExchangeValueService] Find #{@crypto.accronym} for #{@platform.name}"

    result = Cryptocompare::Price.find(
      [@crypto.accronym],
      ['EUR', 'USD'],
      {'e' => @platform.name}
    )

    Exchangetimevalue.create!(
      euro: result[@crypto.accronym]['EUR'],
      dollar: result[@crypto.accronym]['USD'],
      platform: @platform,
      crypto: @crypto
    )
  end
end
