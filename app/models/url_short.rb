class UrlShort < ApplicationRecord
  TOP_AMOUNT = ENV['TOP_AMOUNT'].to_i

  validates :url, presence: true, uniqueness: true
  validates :visits, presence: true, numericality: { greater_than_or_equal_to: 0 }

  after_create :generate_short_url

  private

  def generate_short_url
    range = (('a'..'z').to_a << ('A'..'Z').to_a << (1..9).to_a).flatten
    characters = (id.to_f/range.size).ceil
    position = id % range.size
    self.short_url = range.combination(characters).to_a[position].join
    save!
  end
end
