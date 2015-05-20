module ISO8583
  class Message
    MTI_LENGTH  = 4
    BMP_LENGTH  = 16
    HDR_LENGTH  = 15

    attr_reader :header, :mti, :bitmap, :data, :fields

    def initialize(message)
      @fields = []
      parse(message) if message
      super(message)
    end

    def parse(message)
      @header   = Header.new(message.slice!(0, HDR_LENGTH)) if message.starts_with?('ISO')
      @mti      = MTI.new(message.slice!(0, MTI_LENGTH))
      @bitmap1  = Bitmap.new(message.slice!(0, BMP_LENGTH))
      @bitmap2  = Bitmap.new(message.slice(0, BMP_LENGTH)) if bitmap1.has_element?(1)
      @bitmap   = Bitmap.new([bitmap1, bitmap2].join)
      @data     = Data.new(message)
    end

    def header=(value)
      @header = Header.new(value)
    end

    def mti=(value)
      @mti = MTI.new(value)
    end

    def to_s
      "#{header}#{mti}#{bitmap1}#{data}"
    end
  end
end
