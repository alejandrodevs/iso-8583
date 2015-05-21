module ISO8583
  class Bitmap < Field
    def bmp
      return unless data
      Util.hex_to_bin(data)
    end

    def ids
      return [] unless data
      Util.indexes(bmp, /1/).map(&:next)
    end
  end
end
