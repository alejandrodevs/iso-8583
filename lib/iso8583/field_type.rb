module ISO8583
  class FieldType
    attr_accessor :encoder, :decoder

    def encode(value)
      encoder.call(value)
    end

    def decode(value)
      decoder.call(value)
    end
  end
end
