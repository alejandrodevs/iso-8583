require 'spec_helper'

RSpec.describe ISO8583::FieldType do
  let(:data)      { 'ABC123' }
  let(:value)     { '123456' }
  let(:codec)     { ISO8583::Codec.new(//, :testing) }
  let(:length)    { 3 }
  let(:encoder)   { -> (value, codec, length) { value + ('*' * length) } }
  let(:decoder)   { -> (value, codec, length) { value + ('-' * length) } }
  let(:extractor) { -> (data, length, index) { data[index, length] } }

  before do
    subject.encoder   = encoder
    subject.decoder   = decoder
    subject.extractor = extractor
  end

  describe '#encode' do
    it { expect(subject.encode(value, codec, length)).to eql '123456***' }
  end

  describe '#decode' do
    it { expect(subject.decode(value, codec, length)).to eql '123456---' }
  end

  describe '#extract' do
    it { expect(subject.extract(data, length, 0)).to eql 'ABC' }
  end
end
