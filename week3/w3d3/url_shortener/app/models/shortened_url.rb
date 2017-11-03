require 'securerandom'

class ShortenedUrl < ApplicationRecord
  validates :long_url, :user_id, presence: true
  validates :short_url, uniqueness: true

  def self.random_code
    while true
      code = SecureRandom.urlsafe_base64[0..15]
      break unless ShortenedUrl.exists?(short_url: code)
    end
    code
  end

  def self.create! user, l_url
    result = ShortenedUrl.random_code
    ShortenedUrl.create(short_url: result, long_url: l_url, user_id: user.id)
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :visitor
end
