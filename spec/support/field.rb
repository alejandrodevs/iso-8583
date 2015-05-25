RSpec.shared_examples 'a field' do
  let(:value)   { '1234' }
  let(:codec)   { subject.codec }
  let(:length)  { subject.length }
  let(:data)    { '12341234' }

  it { expect(subject).to be_kind_of(ISO8583::Field) }

  describe '#data' do
    it { expect(subject.data).to eql nil }
  end

  describe '#length' do
    it { expect(subject.length).to eql options[:length] }
  end

  describe '#codec' do
    it { expect(subject.codec).to be_kind_of ISO8583::Codec }
  end

  describe '#type' do
    it { expect(subject.type).to be_kind_of ISO8583::FieldType }
  end

  describe '#to_s' do
    it { expect(subject.to_s).to eql '' }
  end

  describe '#encode' do
    it 'encodes value' do
      expect(subject.type).to receive(:encode).with(value, codec, length) { data }
      subject.encode(value)
      expect(subject.data).to eql data
      expect(subject.value).to eql value
    end
  end

  describe '#decode' do
    it 'decodes value' do
      expect(subject.type).to receive(:decode).with(data, codec, length) { value }
      subject.decode(data)
      expect(subject.data).to eql data
      expect(subject.value).to eql value
    end
  end
end
