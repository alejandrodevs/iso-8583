module ISO8583
  class Message < String
    MTI_START   = 0
    MTI_LENGTH  = 4

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
      return unless primary_bitmap && primary_bitmap.elements.include?(1)
      Bitmap.new(self[BMP_START + (BMP_LENGTH * 1), BMP_LENGTH])
    end

    def data
      Data.new(self[(nodata.size)...size], bitmap.elements)
    end

    def nodata
      mti + primary_bitmap
    end
  end
end
