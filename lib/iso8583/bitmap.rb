module ISO8583
  class Bitmap
    attr_accessor :data

    def initialize(data)
      @data = data
    end

    def bmp
      data.split('').map { |c| Util.hex_to_bin(c) }.join
    end

    def elements
      Util.indexes(bmp, /1/).map(&:next)
    end

    def to_s
      @data
    end
  end
end
