require 'test_helper'

describe Legislator do
  it 'exist' do
    assert Legislator.new
  end

  it 'requires firstname, lastname, bioguide, state, & chamber' do
    legislator = Legislator.new
    refute legislator.valid?
    legislator = legislators(:bob)
    assert legislator.valid?
  end

  it 'must have a uniquie id' do
    bob = legislators(:bob)
    assert bob.valid?
    bob.bioguide_id = legislators(:alice).bioguide_id
    refute bob.valid?
  end

  it 'requires district as well if the chamber is house' do
    # Alice is in the house
    legislator = legislators(:alice)
    legislator.district = nil
    refute legislator.valid?

    legislator.district = 1
    assert legislator.valid?
  end

  it 'will say it should be updated when' do
    # Alice's next update should be 1 month ago.
    assert legislators(:alice).require_update?
    # Bob's next update should be 1 month in the future
    refute legislators(:bob).require_update?
  end

  it 'has many multiple memberships' do
    # Bob is a member of both hsif & hsif02
    assert_equal legislators(:bob).committee_memberships.size, 2
  end
end
