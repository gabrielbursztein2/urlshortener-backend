require 'rails_helper'

describe UrlShort do
  subject { build :url_short }
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_uniqueness_of(:url) }
  it { is_expected.to validate_presence_of(:visits) }
  it { is_expected.to validate_numericality_of(:visits).is_greater_than_or_equal_to(0) }
end
