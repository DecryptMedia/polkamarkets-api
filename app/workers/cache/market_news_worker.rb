class Cache::MarketNewsWorker
  include Sidekiq::Worker

  def perform(market_id)
    market = Market.find(market_id)
    return if market.blank?

    market.news(refresh: true)
  end
end
