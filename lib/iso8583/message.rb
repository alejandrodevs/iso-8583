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
      update_fields_from_bitmap
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

    def add_field(id, value)
      @fields[id] = Field.new(id, value, Definition::FIELDS[id])
      update_fields_order
      update_data_from_fields
      update_bitmap_from_fields
    end

    private

    def update_fields_order
      @fields = fields.sort.to_h
    end

    def update_fields_from_bitmap
      index = 0
      bitmap.elements.each do |el|
        definition  = Definition::FIELDS[el]
        extractor   = Definition.const_get(definition[:type])
        information = extractor.call(data, definition, index)
        @fields[el] = Field.new(el, information, definition)
        index += information.size
      end
    end

    def update_data_from_fields
      @data = Data.new(fields.values.map(&:data).join)
    end

    def update_bitmap_from_fields
    end
  end
end
