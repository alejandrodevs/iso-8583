module ISO8583
  class Util
    class << self
      def hex_to_bin(str)
        each_slice(str, 1).map do |char|
          char.to_i(16).to_s(2).rjust(4, '0')
        end.join
      end

      def bin_to_hex(str)
        each_slice(str, 4).map do |char|
          char.to_i(2).to_s(16).upcase
        end.join
      end

      def each_slice(str, size)
        str.scan(/.{1,#{size}}/)
      end

      def indexes(string, regex)
        string.enum_for(:scan, regex).map do
          Regexp.last_match.begin(0)
        end
      end
    end
  end
end
