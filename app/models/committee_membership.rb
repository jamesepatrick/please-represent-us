class CommitteeMembership < ApplicationRecord
  belongs_to :committee
  belongs_to :legislator

  # attr_accessor :position
end
