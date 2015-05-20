require 'spec_helper'

RSpec.describe ISO8583::Util do
  subject { described_class }

  describe '.hex_to_bin' do
    it { expect(subject.hex_to_bin('C')).to eql '1100' }
    it { expect(subject.hex_to_bin('1')).to eql '0001' }
    it { expect(subject.hex_to_bin('4')).to eql '0100' }
    it { expect(subject.hex_to_bin('7')).to eql '0111' }
    it { expect(subject.hex_to_bin('9')).to eql '1001' }
  end

  describe '.bin_to_hex' do
    it { expect(subject.bin_to_hex('1100')).to eql 'C' }
    it { expect(subject.bin_to_hex('0001')).to eql '1' }
    it { expect(subject.bin_to_hex('0100')).to eql '4' }
    it { expect(subject.bin_to_hex('0111')).to eql '7' }
    it { expect(subject.bin_to_hex('1001')).to eql '9' }
  end

  describe '.indexes' do
    it { expect(subject.indexes('1001001', /1/)).to eql [0, 3, 6] }
    it { expect(subject.indexes('1001001', /0/)).to eql [1, 2, 4, 5] }
    it { expect(subject.indexes('1001001', /2/)).to be_empty }
  end
end
