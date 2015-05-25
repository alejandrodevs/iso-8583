module ISO8583
  class FieldType
    attr_accessor :encoder, :decoder

    def encode(value, codec, length)
      encoder.call(value, codec, length)
    end

    def decode(value, codec, length)
      decoder.call(value, codec, length)
    end
  end
end
