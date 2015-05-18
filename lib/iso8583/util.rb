module ISO8583
  class Util
    class << self
      def hex_to_bin(char)
        char.to_i(16).to_s(2).rjust(4, '0')
      end

      def indexes(string, regex)
        string.enum_for(:scan, regex).map do
          Regexp.last_match.begin(0)
        end
      end
    end
  end
end
