module ISO8583
  class Message < String
    def mti
      MTI.new(self[0...4])
    end
  end
end
