module Api
  module V1
    class UrlsController < Api::V1::ApiController
      skip_before_action :authenticate_user!

      def create
        short_url = UrlService.create_short_url(params[:url])
        render json: { short_url: short_url }, status: 200
      end

      def index
        @top_url = UrlShort.order(visits: :desc).first(UrlShort::TOP_AMOUNT)
      end

      private

      def url_short
        @url_short ||= UrlShort.find_by!(short_url: params[:short_url])
      end
    end
  end
end
