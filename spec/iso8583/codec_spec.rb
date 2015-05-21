require 'spec_helper'

RSpec.describe ISO8583::Codec do
  let(:regexp)  { Regexp.new('example') }
  let(:name)    { :example }

  subject { described_class.new(regexp, name) }

  it { expect(subject).to be_kind_of(Regexp) }
  it { expect(subject).to eql regexp }

  describe '#name' do
    it { expect(subject.name).to eql name }
  end

  describe '#to_s' do
    it { expect(subject.to_s).to eql name }
  end
end
