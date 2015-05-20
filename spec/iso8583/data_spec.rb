require 'spec_helper'

RSpec.describe ISO8583::Data do
  let(:data)   { '082108321601579500301' }
  subject { described_class.new(data) }
  it_behaves_like 'a base field'
end
