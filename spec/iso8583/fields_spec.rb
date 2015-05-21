require 'spec_helper'

RSpec.describe ISO8583::Fields do
  let(:field) { ISO8583::DataField.new(1, length: 4, codec: :N, type: :FIXED)}

  describe '#data' do
    it { expect(subject.data).to be_empty }
    it { expect(subject.data).to be_kind_of Hash }
  end

  describe '#add' do
    it 'adds a field to data' do
      subject.add(field)
      expect(subject.data.values).to include field
    end
  end

  describe '#delete' do
    it 'deletes a field from data' do
      subject.add(field)
      expect(subject.data.values).to include field
      subject.delete(1)
      expect(subject.data.values).to_not include field
    end
  end

  describe '#ids' do
    it 'returns field ids' do
      subject.add(field)
      expect(subject.ids).to eql [1]
    end
  end
end
