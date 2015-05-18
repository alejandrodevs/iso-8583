require 'spec_helper'

RSpec.describe ISO8583::Message do
  let(:mti)       { '0810' }
  let(:bitmaps)   { '82200000020000000400000000000000' }
  let(:data)      { '082108321601579500301' }
  let!(:message)  { mti + bitmaps + data }

  subject { described_class.new(message) }

  it 'it is the message' do
    expect(subject).to eql message
  end

  it 'has a MTI property' do
    expect(subject.mti).to eql mti
    expect(subject.mti).to be_kind_of ISO8583::MTI
  end
end
