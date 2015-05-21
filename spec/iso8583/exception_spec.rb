require 'spec_helper'

RSpec.describe ISO8583 do
  it { expect(ISO8583::ISO8583Exception.new).to be_kind_of Exception }
  it { expect(ISO8583::ISO8583CodecException.new).to be_kind_of ISO8583::ISO8583Exception }
  it { expect(ISO8583::ISO8583LengthException.new).to be_kind_of ISO8583::ISO8583Exception }
end
