class Legislator < ApplicationRecord
  include ActiveModel::Validations

  attr_accessor :firstname,
    :lastname,
    :bioguide_id,
    :state,
    :district,
    :chamber,
    :next_update

  def require_update?
    next_update && next_update > DateTime.now
  end

  validates_presence_of :firstname, :lastname, :bioguide_id, :state, :chamber
  validates :district, presence: true, if: proc { |legislator| legislator.state && legislator.chamber == :house }
end
