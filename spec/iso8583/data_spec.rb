require 'spec_helper'

RSpec.describe ISO8583::Data do
  let(:options) {{ length: 192, codec: :ANS, type: :VAR }}
  subject { described_class.new(options) }

  it_behaves_like 'a field'
end
