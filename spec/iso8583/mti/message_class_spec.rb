require 'spec_helper'

RSpec.describe ISO8583::MTI::MessageClass do
  it { expect(subject).to be_kind_of(ISO8583::MTI::BaseField) }

  describe '#meaning' do
    it { expect(described_class.new('1').meaning).to eql 'Authorization Message' }
    it { expect(described_class.new('2').meaning).to eql 'Financial Messages' }
    it { expect(described_class.new('3').meaning).to eql 'File Actions Message' }
    it { expect(described_class.new('4').meaning).to eql 'Reversal and Chargeback Messages' }
    it { expect(described_class.new('5').meaning).to eql 'Reconciliation Message' }
    it { expect(described_class.new('6').meaning).to eql 'Administrative Message' }
    it { expect(described_class.new('7').meaning).to eql 'Fee Collection Messages' }
    it { expect(described_class.new('8').meaning).to eql 'Network Management Message' }
    it { expect(described_class.new('9').meaning).to eql 'Reserved for ISO use' }
  end
end
