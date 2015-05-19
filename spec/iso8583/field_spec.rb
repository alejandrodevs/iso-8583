require 'spec_helper'

RSpec.describe ISO8583::Field do
  let(:field) { '0123456789' }
  let(:definition) do
    {
      field:  2,
      length: 19,
      codec:  /A-Z/,
      type:   -> (data, length, index) { data[index, length] }
    }
  end

  subject { described_class.new(field, definition) }

  it { expect(subject).to be_kind_of(String) }
  it { expect(subject).to eql field }

  it 'has a definition' do
    expect(subject.definition).to eql definition
  end
end
