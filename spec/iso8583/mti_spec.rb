require 'spec_helper'

RSpec.describe ISO8583::MTI do
  let(:mti) { '0810' }
  subject { described_class.new(mti) }

  it { expect(subject).to be_kind_of(String) }
  it { expect(subject).to eql mti }

  it 'has an ISO version' do
    expect(subject.iso_version).to eql '0'
    expect(subject.iso_version).to be_kind_of ISO8583::MTI::ISOVersion
  end

  it 'has a message class' do
    expect(subject.message_class).to eql '8'
    expect(subject.message_class).to be_kind_of ISO8583::MTI::MessageClass
  end

  it 'has a message function' do
    expect(subject.message_function).to eql '1'
    expect(subject.message_function).to be_kind_of ISO8583::MTI::MessageFunction
  end

  it 'has a message origin' do
    expect(subject.message_origin).to eql '0'
    expect(subject.message_origin).to be_kind_of ISO8583::MTI::MessageOrigin
  end
end
