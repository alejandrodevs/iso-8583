require 'spec_helper'

RSpec.describe ISO8583::Bitmap do
  let(:data) { '0220000002000000' }
  subject { described_class.new(data) }
  it_behaves_like 'a base field'

  describe '#bmp' do
    it { expect(subject.bmp).to eql '0000001000100000000000000000000000000010000000000000000000000000' }
  end

  describe '#elements' do
    it { expect(subject.elements).to eql [7, 11, 39] }
  end
end
