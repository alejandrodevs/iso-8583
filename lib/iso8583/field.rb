module ISO8583
  class Field
    attr_reader :data, :value, :length, :codec, :type

    def initialize(length:, codec:, type:)
      @codec  = codec
      @length = length
      @type   = type
    end

    def encode(value)
      @data  = type.encode(value, codec, length)
      @value = value
    end

    def decode(data)
      @value = type.decode(data, codec, length)
      @data  = data
    end

    def to_s
      @data.to_s
    end

    def codec
      ISO8583.const_get(@codec)
    end

    def type
      ISO8583.const_get(@type)
    end
  end
end
