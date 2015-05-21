require 'spec_helper'

RSpec.describe ISO8583::Field do
  let(:options) {{ length: 4, codec: :A, type: :FIXED }}
  subject { described_class.new(options) }

  it_behaves_like 'a field'
end
