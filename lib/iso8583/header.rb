module ISO8583
  class Header
    attr_accessor :data

    def initialize(data)
      @data = data
    end

    def to_s
      @data
    end
  end
end
