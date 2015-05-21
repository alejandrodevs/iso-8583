require 'spec_helper'

RSpec.describe ISO8583::DataField do
  let(:id)      { 1 }
  let(:options) {{ length: 4, codec: :N, type: :FIXED }}
  subject { described_class.new(id, options) }

  it_behaves_like 'a field'

  describe '#id' do
    it { expect(subject.id).to eql id }
  end
end
