class ExchangeValueService

  def initialize(accronym, platform_name)
    @platform = Platform.find_by_name(platform_name)
    @crypto = Crypto.find_by_accronym(accronym)
    raise ArgumentError if @platform.nil?
    raise ArgumentError if @crypto.nil?
  end

  def call
    result = Cryptocompare::Price.find(
      [@crypto.accronym],
       ['EUR', 'USD'],
       {'e' => @platform.name}
    )

    euro = result[@crypto.accronym]['EUR']
    dollar = result[@crypto.accronym]['USD']

    Exchangetimevalue.create(
      euro: euro,
      dollar: dollar,
      platform: @platform,
      crypto: @crypto
    )
  end
end
