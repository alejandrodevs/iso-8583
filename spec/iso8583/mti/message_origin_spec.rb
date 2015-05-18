require 'spec_helper'

RSpec.describe ISO8583::MTI::MessageOrigin do
  it { expect(subject).to be_kind_of(ISO8583::MTI::BaseField) }

  describe '#meaning' do
    it { expect(described_class.new('0').meaning).to eql 'Acquirer' }
    it { expect(described_class.new('1').meaning).to eql 'Acquirer Repeat' }
    it { expect(described_class.new('2').meaning).to eql 'Issuer' }
    it { expect(described_class.new('3').meaning).to eql 'Issuer Repeat' }
    it { expect(described_class.new('4').meaning).to eql 'Other' }
    it { expect(described_class.new('5').meaning).to eql 'Other Repeat' }
  end
end
