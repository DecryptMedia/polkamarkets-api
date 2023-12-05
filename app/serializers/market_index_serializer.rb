class MarketIndexSerializer < MarketSerializer
  cache expires_in: 24.hours

  has_many :outcomes, class_name: "MarketOutcome", serializer: MarketOutcomeIndexSerializer

  def news
    # not displaying news for index view
    []
  end

  def related_markets
    # not displaying related markets for index view
    []
  end
end
