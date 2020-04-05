require 'rails_helper'

describe 'POST api/v1/urls' do
  let(:params) { { url: Faker::Internet.url } }
  subject { post api_v1_urls_path, params: params, as: :json }

  context 'when there are no urls created' do
    it 'creates the UrlShort' do
      expect { subject }.to change(UrlShort, :count).by(1)
    end
  end

  context 'when the url is already created' do
    let!(:url_short) { create(:url_short, url: params[:url]).decorate }

    it 'returns the same short_url' do
      subject
      expect(json[:short_url]).to eq(url_short.short_url)
    end

    it "doesn't create the UrlShort" do
      expect { subject }.not_to change(UrlShort, :count)
    end
  end
end
