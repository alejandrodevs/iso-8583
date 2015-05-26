module ISO8583
  class FieldType
    attr_accessor :encoder, :decoder, :extractor

    def encode(value, codec, length)
      encoder.call(value, codec, length)
    end

    def decode(value, codec, length)
      decoder.call(value, codec, length)
    end

    def extract(data, length, index)
      extractor.call(data, length, index)
    end
  end
end
