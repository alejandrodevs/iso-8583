require 'spec_helper'

RSpec.describe ISO8583::Bitmap do
  let(:bitmap) { '4210001102C04804' }
  subject { described_class.new(bitmap) }

  it { expect(subject).to be_kind_of(String) }
  it { expect(subject).to eql bitmap }

  it 'has a bits representation' do
    expect(subject.bits).to eql '0100001000010000000000000001000100000010110000000100100000000100'
  end

  it 'represents fields' do
    expect(subject.fields).to eql [2, 7, 12, 28, 32, 39, 41, 42, 50, 53, 62]
  end
end
