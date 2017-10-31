require 'test_helper'

describe Legislator do
  it 'exist' do
    assert Legislator.new
  end

  it 'requires firstname, lastname, bioguide, state, & chamber' do
    legislator = Legislator.new
    refute legislator.valid?
    legislator = Legislator.new(firstname: 'Alice', lastname: 'Smith', bioguide_id: 'S0000', state: 'GA', chamber: :senate)
    assert legislator.valid?
  end

  it 'requires district as well if the chamber is house' do
    legislator = Legislator.new(firstname: 'Alice', lastname: 'Smith', bioguide_id: 'S0000', state: 'GA', chamber: :house)
    refute legislator.valid?

    legislator.district = 1
    assert legislator.valid?
  end
end
