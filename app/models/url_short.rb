class UrlShort < ApplicationRecord
  TOP_AMOUNT = ENV['TOP_AMOUNT'].to_i

  validates :url, :short_url, presence: true, uniqueness: true
  validates :visits, presence: true
end
