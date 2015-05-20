require 'spec_helper'

RSpec.describe ISO8583::BaseField do
  let(:data) { 'data' }
  subject { described_class.new(data) }
  it_behaves_like 'a base field'
end
