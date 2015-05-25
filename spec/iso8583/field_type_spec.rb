require 'spec_helper'

RSpec.describe ISO8583::FieldType do
  let(:value)   { '1234' }
  let(:codec)   { ISO8583::Codec.new(//, :testing) }
  let(:length)  { 10 }
  let(:encoder) { -> (a, b, c) { a + b + c } }
  let(:decoder) { -> (a, b, c) { a + b - c } }

  before do
    subject.encoder = encoder
    subject.decoder = decoder
  end

  describe '#encode' do
    it 'calls encoder method' do
      expect(encoder).to receive(:call).with(value, codec, length) { 'Encoded!' }
      expect(subject.encode(value, codec, length)).to eql 'Encoded!'
    end
  end

  describe '#decode' do
    it 'calls decoder method' do
      expect(decoder).to receive(:call).with(value, codec, length) { 'Decoded!' }
      expect(subject.decode(value, codec, length)).to eql 'Decoded!'
    end
  end
end
