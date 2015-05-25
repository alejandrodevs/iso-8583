require 'spec_helper'

RSpec.describe ISO8583::Fields do
  let(:field1) { ISO8583::DataField.new(1, length: 4, codec: :N, type: :FIXED)}
  let(:field2) { ISO8583::DataField.new(2, length: 8, codec: :N, type: :FIXED)}
  let(:field3) { ISO8583::DataField.new(3, length: 6, codec: :N, type: :FIXED)}

  describe '#data' do
    it { expect(subject.data).to be_empty }
    it { expect(subject.data).to be_kind_of Hash }
  end

  describe '#add' do
    it 'adds a field to data' do
      subject.add(field1)
      expect(subject.data.values).to include field1
    end

    it 'orders fields' do
      subject.add(field1)
      subject.add(field3)
      subject.add(field2)
      expect(subject.ids).to eql [1, 2, 3]
    end

    it 'return field' do
      expect(subject.add(field1)).to eql field1
    end
  end

  describe '#delete' do
    it 'deletes a field from data' do
      subject.add(field1)
      expect(subject.data.values).to include field1
      subject.delete(1)
      expect(subject.data.values).to_not include field1
    end

    it 'return field id' do
      subject.add(field3)
      expect(subject.delete(3)).to eql 3
    end
  end

  describe '#ids' do
    it 'returns field ids' do
      subject.add(field1)
      expect(subject.ids).to eql [1]
    end
  end

  describe '#[]' do
    it 'returns field with that id' do
      subject.add(field1)
      expect(subject[1]).to eql field1
    end
  end
end
