class UrlShortDecorator < Draper::Decorator
  delegate_all

  def short_url
    "#{ENV['SERVER_URL']}/#{object.short_url}"
  end
end
