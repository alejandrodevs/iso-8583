module ISO8583
  class MTI
    attr_accessor :data

    def initialize(data)
      @data = data
    end

    def iso_version
      ISOVersion.new(data[0])
    end

    def message_class
      MessageClass.new(data[1])
    end

    def message_function
      MessageFunction.new(data[2])
    end

    def message_origin
      MessageOrigin.new(data[3])
    end

    def to_s
      @data
    end
  end
end
