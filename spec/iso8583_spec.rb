require 'spec_helper'

RSpec.describe ISO8583 do
  it 'has a version number' do
    expect(ISO8583::VERSION).not_to be nil
  end
end
