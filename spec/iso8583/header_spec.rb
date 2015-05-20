require 'spec_helper'

RSpec.describe ISO8583::Header do
  let(:data) { 'ISO021100055' }
  subject { described_class.new(data) }
  it_behaves_like 'a base field'
end
