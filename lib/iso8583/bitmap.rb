module ISO8583
  class Bitmap < String
    def bitmap
      split('').map { |c| Util.hex_to_bin(c) }.join
    end

    def fields
      Util.indexes(bitmap, /1/).map(&:next)
    end
  end
end
