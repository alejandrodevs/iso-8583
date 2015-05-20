require 'spec_helper'

RSpec.describe ISO8583::Field do
  let(:id)      { 3 }
  let(:data)    { '012345' }
  let(:options) { { length: 6, codec: :N, type: :FIXED } }

  subject { described_class.new(id, data, options) }
  it_behaves_like 'a base field'

  describe '#id' do
    it { expect(subject.id).to eql id }
  end

  describe '#options' do
    it { expect(subject.options).to eql options }
  end

  describe '#value' do
    context 'when it is FIXED' do
      it { expect(subject.value).to eql data }
    end

    context 'when it is LVAR' do
      let(:options) { { length: 6, codec: :N, type: :LVAR } }
      subject { described_class.new(id, data, options) }

      it { expect(subject.value).to eql data[1, data.size] }
    end

    context 'when it is LLVAR' do
      let(:options) { { length: 6, codec: :N, type: :LLVAR } }
      subject { described_class.new(id, data, options) }

      it { expect(subject.value).to eql data[2, data.size] }
    end

    context 'when it is LLLVAR' do
      let(:options) { { length: 6, codec: :N, type: :LLLVAR } }
      subject { described_class.new(id, data, options) }

      it { expect(subject.value).to eql data[3, data.size] }
    end
  end
end
