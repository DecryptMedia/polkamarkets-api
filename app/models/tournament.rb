class Tournament < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :description, :network_id
  validate :markets_network_id_validation

  has_and_belongs_to_many :markets
  belongs_to :tournament_group

  acts_as_list scope: :tournament_group

  def markets_network_id_validation
    markets.each do |market|
      errors.add(:markets, 'network id is not valid') unless market.network_id == network_id
    end
  end
end
