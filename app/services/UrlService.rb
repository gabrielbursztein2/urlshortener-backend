class UrlService
  def self.create_short_url(url)
    already_created_url = UrlShort.find_by(url: url)&.short_url
    return already_created_url if already_created_url.present?

    short_url = url_shortener(url)
    UrlShort.create!(url: url, short_url: short_url)
    "#{ENV['SERVER_URL']}/#{short_url}"
  end

  def self.url_shortener(url)
    (0...8).map { (65 + rand(26)).chr }.join
  end
end
