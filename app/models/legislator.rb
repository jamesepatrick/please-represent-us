class Legislator < ApplicationRecord

  include ActiveModel::Validations
  enum chamber: { house: 'house', senate: 'senate' }
  has_many :committee_memberships

  validates_presence_of :firstname, :lastname, :bioguide_id, :state, :chamber
  validates :district, presence: true, if: proc { |legislator| legislator.state && legislator.house? }

  def require_update?
    !next_update || !next_update.future?
  end
end
