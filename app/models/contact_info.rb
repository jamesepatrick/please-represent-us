class ContactInfo < ApplicationRecord
  PHONE_REGEX = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/

  belongs_to :legislator
  validates :phone, format: { with: PHONE_REGEX }, allow_blank: true
  validates :fax,   format: { with: PHONE_REGEX }, allow_blank: true

  def facebook_url
    "https://facebook.com/#{youtube}"
  end

  def twitter_url
    "https://twitter.com/#{twitter}"
  end

  def youtube_url
    "https://www.youtube.com/user/#{youtube}"
  end
end
