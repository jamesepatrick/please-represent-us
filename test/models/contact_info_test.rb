require 'test_helper'

describe ContactInfo do
  it 'validates the phone and fax numbers' do
    contact = contact_infos(:alice)

    # Both are optional
    contact.update(fax: nil, phone: nil)
    assert contact.valid?

    # Non valid phone numbers will fail
    contact.update(fax: '12', phone: 'Pringles')
    refute contact.valid?

    # actual validation doesn't much care about its format
    contact.update(fax: '123-123-1234', phone: '1234567890')
    assert contact.valid?
    contact.update(fax: '(123)123-1234', phone: '1231231234')
    assert contact.valid?
    contact.update(fax: '(123) 123-1234', phone: '123 123 1234')
    assert contact.valid?
  end

  it 'has handlers method for getting urls for facebook, twitter, & youtube' do
    contact = contact_infos(:alice)
    assert_equal contact.facebook_url, 'https://facebook.com/alice'
    assert_equal contact.twitter_url,  'https://twitter.com/alice'
    assert_equal contact.youtube_url,  'https://www.youtube.com/user/alice'
  end
end
