class ShortUrlsController < ApplicationController
  def show
    if url_short.present?
      url_short.increment!(:visits)
      redirect_to url_short.url
    else
      redirect to ENV['FRONTENT_URL']
    end
  end

  private

  def url_short
    @url_short ||= UrlShort.find_by(short_url: params[:short_url])
  end
end
