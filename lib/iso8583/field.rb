module ISO8583
  class Field
    attr_reader :data, :length, :codec, :type

    def initialize(data, length:, codec:, type:)
      @codec = codec
      @length = length
      @type = type
      self.data = data
    end

    def data=(value)
      raise ISO8583CodecException,  "Field must have only #{codec} characters" if value !~ codec
      raise ISO8583LengthException, "Field must have #{length} characters" if value.size != length && type == :FIXED
      raise ISO8583LengthException, "Field must have at most #{length} characters" if value.size > length && type != :FIXED
      @data = value
    end

    def to_s
      @data
    end
  end
end
