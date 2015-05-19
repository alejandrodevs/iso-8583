require 'spec_helper'

RSpec.describe ISO8583::Message do
  let(:mti)       { '0810' }
  let(:bitmap)    { '82200000020000000400000000000000' }
  let(:data)      { '082108321601579500301' }
  let!(:message)  { mti + bitmap + data }

  subject { described_class.new(message) }

  it { expect(subject).to be_kind_of(String) }
  it { expect(subject).to eql message }

  describe '#mti' do
    it { expect(subject.mti).to eql mti }
    it { expect(subject.mti).to be_kind_of ISO8583::MTI }
  end

  describe '#bitmap' do
    it { expect(subject.bitmap).to eql bitmap }
    it { expect(subject.bitmap).to be_kind_of ISO8583::Bitmap }
  end

  describe '#primary_bitmap' do
    it { expect(subject.primary_bitmap).to eql bitmap[0, 16] }
    it { expect(subject.primary_bitmap).to be_kind_of ISO8583::Bitmap }
  end

  describe '#secondary_bitmap' do
    it { expect(subject.secondary_bitmap).to eql bitmap[16, 16] }
    it { expect(subject.secondary_bitmap).to be_kind_of ISO8583::Bitmap }
  end

  describe '#fields' do
    it { expect(subject.fields).to eql [1, 7, 11, 39, 70] }
  end

  describe '#data' do
    it { expect(subject.data).to eql data }
    it { expect(subject.data).to be_kind_of ISO8583::Data }
  end

  describe '#nodata' do
    it { expect(subject.nodata).to eql mti + bitmap }
    it { expect(subject.nodata).to be_kind_of String }
  end
end
