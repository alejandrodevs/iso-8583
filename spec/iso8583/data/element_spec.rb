require 'spec_helper'

RSpec.describe ISO8583::Data::Element do
  let(:element)     { '0123456789' }
  let(:definition)  {{ field: 2, format: :N, length: 19, type: :ll }}
  subject { described_class.new(element, definition) }

  it { expect(subject).to be_kind_of(String) }
  it { expect(subject).to eql element }

  it 'has a definition' do
    expect(subject.definition).to eql definition
  end
end
