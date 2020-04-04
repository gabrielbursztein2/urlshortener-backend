class UrlShort < ApplicationRecord
  TOP_AMOUNT = ENV['TOP_AMOUNT'].to_i

  validates :url, :short_url, presence: true, uniqueness: true
  validates :visits, presence: true

  before_validation :generate_short_url

  private

  def generate_short_url
    self.short_url = loop do
      token = SecureRandom.urlsafe_base64(5, false)
      break token unless UrlShort.exists?(short_url: token)
    end
  end
end
