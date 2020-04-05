require 'rails_helper'

describe 'GET api/v1/urls' do
  subject { get api_v1_urls_path, as: :json }

  context 'when there are no urls created' do
    it 'returns no urls' do
      subject
      expect(json[:top_url].count).to eq(0)
    end
  end

  context 'when there are urls created' do
    let!(:url_short) { create(:url_short).decorate }

    it 'returns url data' do
      subject
      expect(json[:top_url][0][:url]).to eq(url_short.url)
      expect(json[:top_url][0][:short_url]).to eq(url_short.short_url)
      expect(json[:top_url][0][:visits]).to eq(url_short.visits)
    end
  end

  context 'when there are more than 100 urls created' do
    before { create_list(:url_short, 101) }

    it 'returns only 100' do
      subject
      expect(json[:top_url].count).to eq(100)
    end
  end
end
