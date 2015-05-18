require 'spec_helper'

RSpec.describe ISO8583::MTI::ISOVersion do
  it { expect(subject).to be_kind_of(ISO8583::MTI::BaseField) }

  describe '#meaning' do
    it { expect(described_class.new('0').meaning).to eql 'ISO 8583-1:1987 version' }
    it { expect(described_class.new('1').meaning).to eql 'ISO 8583-2:1993 version' }
    it { expect(described_class.new('2').meaning).to eql 'ISO 8583-3:2003 version' }
    it { expect(described_class.new('3').meaning).to eql 'Reserved for ISO use' }
    it { expect(described_class.new('4').meaning).to eql 'Reserved for ISO use' }
    it { expect(described_class.new('5').meaning).to eql 'Reserved for ISO use' }
    it { expect(described_class.new('6').meaning).to eql 'Reserved for ISO use' }
    it { expect(described_class.new('7').meaning).to eql 'Reserved for ISO use' }
    it { expect(described_class.new('8').meaning).to eql 'Reserved for National use' }
    it { expect(described_class.new('9').meaning).to eql 'Reserved for Private use' }
  end
end
