module ISO8583
  class Message
    attr_reader :header, :mti, :bitmap, :data, :fields

    def initialize(message = nil)
      @header = Header.new(HDR_DEFINITION)
      @mti    = MTI.new(MTI_DEFINITION)
      @bitmap = Bitmap.new(BMP_DEFINITION)
      @data   = Data.new(DTA_DEFINITION)
      @fields = Fields.new
      parse(message) if message
    end

    def header=(value)
      @header.encode(value)
    end

    def mti=(value)
      @mti.encode(value)
    end

    def to_s
      "#{header}#{mti}#{bitmap}#{data}"
    end

    def set_field(id, value)
      field = add_field(id, value)
      update_message
      field
    end

    def unset_field(id)
      field = delete_field(id)
      update_message
      field
    end

    private

    def add_field(id, value)
      field = DataField.new(id, FIELDS[id])
      field.encode(value)
      fields.add(field)
    end

    def delete_field(id)
      fields.delete(id)
    end

    def update_message
      remove_bitmap_fields
      update_bitmap_fields
      update_data
    end

    def remove_bitmap_fields
      delete_field(1)
      delete_field(65)
    end

    def update_bitmap_fields
      bitmaps = get_bmps_from_fields
      bitmap.encode(bitmaps[0])
      add_field(1,  bitmaps[1]) if bitmaps[1]
      add_field(65, bitmaps[2]) if bitmaps[2]
    end

    def update_data
      @data.encode(fields.data.values.map(&:data).join)
    end

    def bmp_from_fields
      fields_range.map { |e| bmp_id?(e) ? 1 : 0 }.join
    end

    def bmp_id?(id)
      fields.ids.any? && (fields.ids.include?(id) ||
        (id == 1  && fields.ids.max > 65) ||
        (id == 65 && fields.ids.max > 129))
    end

    def hmp_from_fields
      Util.bin_to_hex(bmp_from_fields)
    end

    def fields_range
      return 1..64 if fields.ids.empty?
      1..(fields.ids.max / 64.0).ceil * 64
    end

    def get_bmps_from_fields
      Util.each_slice(hmp_from_fields, BMP_LENGTH)
    end

    def parse(message)
      @header.encode(message.slice!(0, HDR_LENGTH)) if message.start_with?('ISO')
      @mti.encode(message.slice!(0, MTI_LENGTH))
      @bitmap.encode(message.slice!(0, BMP_LENGTH))
      @data.encode(message)
      parse_fields
    end

    def parse_fields
      index = 0
      bitmap.ids.each do |el|
        field_id    = el
        definition  = FIELDS[field_id]
        field_type  = ISO8583.const_get(definition[:type])
        information = field_type.extract(data.to_s, definition[:length], index)
        add_field(field_id, information)
        index += information.size
      end

      return unless fields[1]
      bitmap2 = Bitmap.new(BMP_DEFINITION)
      bitmap2.encode(fields[1].data)

      bitmap2.ids.each do |el|
        field_id    = el + 64
        definition  = FIELDS[field_id]
        field_type  = ISO8583.const_get(definition[:type])
        information = field_type.extract(data.to_s, definition[:length], index)
        add_field(field_id, information)
        index += information.size
      end
    end
  end
end
