require 'spec_helper'

RSpec.describe ISO8583::MTI::MessageFunction do
  it { expect(subject).to be_kind_of(ISO8583::MTI::BaseField) }

  describe '#meaning' do
    it { expect(described_class.new('0').meaning).to eql 'Request' }
    it { expect(described_class.new('1').meaning).to eql 'Request Response' }
    it { expect(described_class.new('2').meaning).to eql 'Advice' }
    it { expect(described_class.new('3').meaning).to eql 'Advice Response' }
    it { expect(described_class.new('4').meaning).to eql 'Notification' }
    it { expect(described_class.new('5').meaning).to eql 'Notification Acknowledgement' }
    it { expect(described_class.new('6').meaning).to eql 'Instruction' }
    it { expect(described_class.new('7').meaning).to eql 'Instruction Acknowledgement' }
    it { expect(described_class.new('8').meaning).to eql 'Reserved for ISO use' }
    it { expect(described_class.new('9').meaning).to eql 'Reserved for ISO use' }
  end
end
