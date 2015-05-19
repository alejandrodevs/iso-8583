require 'spec_helper'

RSpec.describe ISO8583::Data do
  let(:data)   { '0400000000000000082108321601579500301' }
  let(:fields) { [1, 7, 11, 39, 70] }
  subject { described_class.new(data, fields) }

  it { expect(subject).to be_kind_of(String) }
  it { expect(subject).to eql data }

  describe '#elements' do
    let(:elements) do
      ['0400000000000000', '0821083216', '015795', '00', '301']
    end

    it { expect(subject.elements).to eql elements }
  end
end
