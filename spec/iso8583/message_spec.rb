require 'spec_helper'

RSpec.describe ISO8583::Message do
  MTI     = '0810'
  BITMAPS = '82200000020000000400000000000000'
  DATA    = '082108321601579500301'
  MESSAGE = MTI + BITMAPS + DATA

  subject { described_class.new(MESSAGE) }

  it 'it is the message' do
    expect(subject).to eql MESSAGE
  end

  it 'has a MTI property' do
    expect(subject.mti).to eql MTI
    expect(subject.mti).to be_kind_of ISO8583::MTI
  end
end
