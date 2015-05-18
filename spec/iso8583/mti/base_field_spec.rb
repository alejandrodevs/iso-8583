require 'spec_helper'

RSpec.describe ISO8583::MTI::BaseField do
  it 'meaning is nil' do
    expect(subject.meaning).to be_nil
  end

  it 'there is not meanings' do
    expect(subject.meanings).to be_empty
  end
end
