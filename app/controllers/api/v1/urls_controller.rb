module Api
  module V1
    class UrlsController < Api::V1::ApiController
      skip_before_action :authenticate_user!

      def create
        @url_short = UrlShort.find_or_create_by(url: params[:url]&.delete(' ')).decorate
      end

      def index
        @top_url = UrlShortDecorator.decorate_collection(
          UrlShort.order(visits: :desc).first(UrlShort::TOP_AMOUNT)
        )
      end
    end
  end
end
