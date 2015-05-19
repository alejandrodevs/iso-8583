module ISO8583
  class Bitmap < String
    def bits
      split('').map { |c| Util.hex_to_bin(c) }.join
    end

    def fields
      Util.indexes(bits, /1/).map(&:next)
    end
  end
end
