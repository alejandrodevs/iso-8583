RSpec.shared_examples 'a field' do
  it { expect(subject).to be_kind_of(ISO8583::Field) }

  describe '#data' do
    it { expect(subject.data).to eql nil }
  end

  describe '#length' do
    it { expect(subject.length).to eql options[:length] }
  end

  describe '#codec' do
    it { expect(subject.codec).to eql options[:codec] }
  end

  describe '#type' do
    it { expect(subject.type).to eql options[:type] }
  end

  describe '#to_s' do
    it { expect(subject.to_s).to eql '' }
  end
end
