require 'test_helper'

describe CommitteeMembership do
  it 'exist' do
    CommitteeMembership.new
  end
  it 'has a committee' do
    hsif_committee = committee_memberships(:one).committee
    assert_equal hsif_committee, committees(:hsif)
  end
  it 'has a legislator' do
    alice = committee_memberships(:one).legislator
    assert_equal alice, legislators(:alice)
  end
end
