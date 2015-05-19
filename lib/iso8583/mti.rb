module ISO8583
  class MTI < String
    def iso_version
      ISOVersion.new(self[0])
    end

    def message_class
      MessageClass.new(self[1])
    end

    def message_function
      MessageFunction.new(self[2])
    end

    def message_origin
      MessageOrigin.new(self[3])
    end
  end
end
