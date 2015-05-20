module ISO8583
  class Bitmap < BaseField
    def bmp
      data.split('').map { |c| Util.hex_to_bin(c) }.join
    end

    def elements
      Util.indexes(bmp, /1/).map(&:next)
    end
  end
end
