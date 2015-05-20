RSpec.shared_examples 'a base field' do
  it { expect(subject).to be_kind_of(ISO8583::BaseField) }

  describe '#data' do
    it { expect(subject.data).to eql data }
  end

  describe '#to_s' do
    it { expect(subject.to_s).to eql data }
  end
end
