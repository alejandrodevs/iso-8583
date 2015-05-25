require 'spec_helper'

RSpec.describe ISO8583::Message do
  let(:header)  { 'ISO021100055' }
  let(:mti)     { '0810' }

  describe 'initial state' do
    it { expect(subject.header).to be_kind_of ISO8583::Header }
    it { expect(subject.header.to_s).to be_empty }
    it { expect(subject.mti).to be_kind_of ISO8583::MTI }
    it { expect(subject.mti.to_s).to be_empty }
    it { expect(subject.bitmap).to be_kind_of ISO8583::Bitmap }
    it { expect(subject.bitmap.to_s).to be_empty }
    it { expect(subject.data).to be_kind_of ISO8583::Data }
    it { expect(subject.data.to_s).to be_empty }
    it { expect(subject.fields).to be_kind_of ISO8583::Fields }
    it { expect(subject.fields.data).to be_empty }
  end

  describe '#header=' do
    context 'when it is valid' do
      it 'sets value correctly' do
        subject.header = header
        expect(subject.header.to_s).to eql header
      end
    end

    context 'when it is invalid' do
      it 'throws an exception' do
        expect { subject.header = '//ª' }.to raise_exception(ISO8583::ISO8583CodecException)
        expect { subject.header = 'ISO' }.to raise_exception(ISO8583::ISO8583LengthException)
      end
    end
  end

  describe '#mti=' do
    context 'when it is valid' do
      it 'sets value correctly' do
        subject.mti = mti
        expect(subject.mti.to_s).to eql mti
      end
    end

    context 'when it is invalid' do
      it 'throws an exception' do
        expect { subject.mti = '020A' }.to raise_exception(ISO8583::ISO8583CodecException)
        expect { subject.mti = '020' }.to raise_exception(ISO8583::ISO8583LengthException)
      end
    end
  end

  describe '#to_s' do
    it 'return full ISO message' do
      subject.header = header
      subject.mti = mti
      subject.set_field(7, '0821083216')
      expect(subject.to_s).to eql 'ISO021100055081002000000000000000821083216'
    end
  end

  describe '#set_field' do
    it 'adds field to message' do
      subject.set_field(7, '0821083216')
      subject.set_field(39, '00')
      subject.set_field(11, '015795')
      expect(subject.fields.ids).to eql [7, 11, 39]
    end
  end

  describe '#unset_field' do
    it 'removes field to message' do
      subject.set_field(7, '0821083216')
      subject.set_field(39, '00')
      subject.set_field(11, '015795')
      subject.unset_field(39)
      expect(subject.fields.ids).to eql [7, 11]
    end
  end
end
