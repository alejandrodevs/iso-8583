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
      subject.set_field(2, '8899')
      subject.set_field(105, 'ABC123')
      expect(subject.to_s).to eql 'ISO0211000550810C20000000000000000000000008000000488990821083216006ABC123'
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

  describe 'decoding message' do
    context 'when has one bitmap' do
      let(:header)  { 'ISO021100055' }
      let(:mti)     { '0810' }
      let(:bitmap)  { '0220000002000000' }
      let(:data)    { '082108321601579500301' }
      let(:message) { header + mti + bitmap + data }
      subject { described_class.new(message) }

      it { expect(subject.header.data).to eql header }
      it { expect(subject.mti.data).to eql mti }
      it { expect(subject.bitmap.data).to eql bitmap }
      it { expect(subject.data.data).to eql data }
      it { expect(subject.fields.ids).to eql [7, 11, 39] }
    end

    context 'when has two bitmaps' do
      let(:header)  { 'ISO021100055' }
      let(:mti)     { '0810' }
      let(:bitmap)  { '8220000002000000' }
      let(:data)    { '0400000000000000082108321601579500301' }
      let(:message) { header + mti + bitmap + data }
      subject { described_class.new(message) }

      it { expect(subject.header.data).to eql header }
      it { expect(subject.mti.data).to eql mti }
      it { expect(subject.bitmap.data).to eql bitmap }
      it { expect(subject.data.data).to eql data }
      it { expect(subject.fields.ids).to eql [1, 7, 11, 39, 70] }
    end

    context 'when has not header' do
      let(:mti)     { '0810' }
      let(:bitmap)  { '0220000002000000' }
      let(:data)    { '082108321601579500301' }
      let(:message) { mti + bitmap + data }
      subject { described_class.new(message) }

      it { expect(subject.header.data).to eql nil }
      it { expect(subject.mti.data).to eql mti }
      it { expect(subject.bitmap.data).to eql bitmap }
      it { expect(subject.data.data).to eql data }
      it { expect(subject.fields.ids).to eql [7, 11, 39] }
    end
  end
end
