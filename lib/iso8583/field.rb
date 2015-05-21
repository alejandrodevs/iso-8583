module ISO8583
  class Field
    attr_accessor :data
    attr_reader :length, :codec, :type

    def initialize(length:, codec:, type:)
      @codec  = codec
      @length = length
      @type   = type
    end

    def to_s
      @data.to_s
    end
  end
end
