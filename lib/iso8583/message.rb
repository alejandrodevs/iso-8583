module ISO8583
  class Message
    MTI_LENGTH = 4
    BMP_LENGTH = 16
    HDR_LENGTH = 12

    attr_reader :header, :mti, :bitmap, :data, :fields

    def initialize(message = nil)
      @fields = {}
      parse(message) if message
    end

    def header=(value)
      @header.data = value
    end

    def mti=(value)
      @mti.data = value
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
      update_bitmap_from_fields
      update_data_from_fields
    end

    private

    def parse(message)
      @header = Header.new(message.slice!(0, HDR_LENGTH)) if message.start_with?('ISO')
      @mti    = MTI.new(message.slice!(0, MTI_LENGTH))
      @bitmap = Bitmap.new(message.slice!(0, BMP_LENGTH))
      @data   = Data.new(message)
      update_fields_from_bitmap
    end

    def update_fields_order
      @fields = fields.sort.to_h
    end

    def update_fields_from_bitmap
      index = 0
      elements.each do |el|
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
      bitmaps = fields_to_hex.scan(/.{1,#{BMP_LENGTH}}/)
      @bitmap = Bitmap.new(bitmaps[0])
      @fields[1]  = Field.new(1, bitmaps[1], Definition::FIELDS[1]) if bitmaps[1]
      @fields[65] = Field.new(65, bitmaps[65], Definition::FIELDS[65]) if bitmaps[2]
      update_fields_order
    end

    def fields_to_bin
      ((fields.keys.max / 64.0).ceil * 64).times.map do |e|
        fields.keys.include?(e + 1) ? '1' : '0'
      end.join
    end

    def fields_to_hex
      fields_to_bin.scan(/.{1,#{4}}/).map do |e|
        Util.bin_to_hex(e)
      end.join
    end

    def elements
      ids = bitmap.elements
      ids.concat(Bitmap.new(fields[1]).elements) if fields[1]
      ids.concat(Bitmap.new(fields[65]).elements) if fields[65]
      ids
    end
  end
end
