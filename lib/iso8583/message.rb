module ISO8583
  class Message
    MTI_LENGTH = 4
    BMP_LENGTH = 16
    HDR_LENGTH = 12

    attr_reader :header, :mti, :bitmap, :data, :fields

    def initialize(message)
      @fields = {}
      parse(message) if message
    end

    def parse(message)
      @header = Header.new(message.slice!(0, HDR_LENGTH)) if message.start_with?('ISO')
      @mti    = MTI.new(message.slice!(0, MTI_LENGTH))
      @bitmap = Bitmap.new(message.slice!(0, BMP_LENGTH))
      @data   = Data.new(message)
      extract_fields_from_bitmap
    end

    def header=(value)
      @header = Header.new(value)
    end

    def mti=(value)
      @mti = MTI.new(value)
    end

    def to_s
      "#{header}#{mti}#{bitmap}#{data}"
    end

    def fields
      @fields.dup
    end

    private

    def extract_fields_from_bitmap
      index = 0
      bitmap.elements.each do |el|
        definition  = Definition::FIELDS[el]
        extractor   = Definition.const_get(definition[:type])
        information = extractor.call(data, definition, index)
        @fields[el] = Field.new(el, information, definition)
        index += information.size
      end
    end
  end
end
