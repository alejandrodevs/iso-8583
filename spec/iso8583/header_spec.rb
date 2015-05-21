require 'spec_helper'

RSpec.describe ISO8583::Header do
  let(:options) {{ length: 12, codec: :AN, type: :FIXED }}
  subject { described_class.new(options) }

  it_behaves_like 'a field'
end
