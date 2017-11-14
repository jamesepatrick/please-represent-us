require 'test_helper'

describe Committee do
  it 'works' do
    Committee.new
  end
  it 'has subcomittees if its a committee' do
    committee = committees(:hsif)
    assert committee.subcommittees
    assert_equal committee.subcommittees.first, committees(:hsif02)
  end
  it 'has no parent if its a committee' do
    refute committees(:hsif).parent
  end
  it 'has a parent if its a subcommittees' do
    assert_equal committees(:hsif02).parent, committees(:hsif)
  end
  it 'requires chamber, code, & name. URL is optional' do
    committee = Committee.new
    refute committee.valid?
    committee.update(chamber: 'house', code: '123', name: 'example')
    assert committee.valid?
  end
end
