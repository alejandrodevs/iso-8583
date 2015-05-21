module ISO8583
  class Field
    attr_reader :data, :value, :length, :codec, :type

    def initialize(length:, codec:, type:)
      @codec  = codec
      @length = length
      @type   = type
    end

    def data=(value)
      raise ISO8583CodecException,  "Must match /#{codec.source}/"  if value !~ codec
      raise ISO8583LengthException, "Must have length == #{length}" if value.size != length && @type == :FIXED
      raise ISO8583LengthException, "Must have length <= #{length}" if value.size >  length && @type != :FIXED
      @data = encode(value)
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

    private

    def encode(value)
      type.call(value)
    end
  end
end
