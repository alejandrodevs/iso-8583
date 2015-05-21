require 'spec_helper'

RSpec.describe ISO8583::MTI do
  let(:options) {{ length: 4, codec: :N, type: :FIXED }}
  subject { described_class.new(options) }

  it_behaves_like 'a field'
end
