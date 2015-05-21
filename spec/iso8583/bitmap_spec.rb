require 'spec_helper'

RSpec.describe ISO8583::Bitmap do
  let(:options) {{ length: 16, codec: :AN, type: :FIXED }}
  subject { described_class.new(options) }

  it_behaves_like 'a field'

  describe '#bmp' do
    context 'when has data' do
      it 'returns the binary map' do
        subject.data = '0220000002000000'
        expect(subject.bmp).to eql '0000001000100000000000000000000000000010000000000000000000000000'
      end
    end

    context 'when does not have data' do
      it { expect(subject.bmp).to be nil }
    end
  end

  describe '#ids' do
    context 'when has data' do
      it 'returns fields ids' do
        subject.data = '0220000002000000'
        expect(subject.ids).to eql [7, 11, 39]
      end
    end

    context 'when does not have data' do
      it { expect(subject.ids).to eql [] }
    end
  end
end
