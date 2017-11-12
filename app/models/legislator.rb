class Legislator < ApplicationRecord

  include ActiveModel::Validations

  enum chamber: { house: 'house', senate: 'senate' }
  # has_many :committee_membership

  attr_accessor :firstname,
    :lastname,
    :bioguide_id,
    :state,
    :district,
    :updated_at,
    :next_update



  def require_update?
    next_update && next_update > DateTime.now
  end

  validates_presence_of :firstname, :lastname, :bioguide_id, :state, :chamber
  validates :district, presence: true, if: proc { |legislator| legislator.state && legislator.house? }
end
