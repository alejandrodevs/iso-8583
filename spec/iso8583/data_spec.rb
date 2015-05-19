require 'spec_helper'

RSpec.describe ISO8583::Data do
  let(:data)   { '082108321601579500301' }
  let(:fields) { [1, 7, 11, 39, 70] }
  subject { described_class.new(data, fields) }

  it { expect(subject).to be_kind_of(String) }
  it { expect(subject).to eql data }
end
