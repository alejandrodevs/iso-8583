module ISO8583
  class Message < String
    MTI_START   = 0
    MTI_LENGTH  = 4

    BMPS        = 3
    BMP_START   = 4
    BMP_LENGTH  = 16


    def mti
      MTI.new(self[MTI_START, MTI_LENGTH])
    end

    def bitmap
      Bitmap.new([primary_bitmap, secondary_bitmap].map(&:to_s).join)
    end

    def primary_bitmap
      Bitmap.new(self[BMP_START, BMP_LENGTH])
    end

    def secondary_bitmap
      return unless primary_bitmap && primary_bitmap.fields.include?(1)
      Bitmap.new(self[BMP_START + (BMP_LENGTH * 1), BMP_LENGTH])
    end

    def fields
      bitmap.fields
    end

    def data
      Data.new(self[(nodata.size)...size], fields)
    end

    def nodata
      mti + bitmap
    end
  end
end
