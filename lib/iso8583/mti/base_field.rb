module ISO8583
  class MTI::BaseField < String
    def meaning
      meanings[self.to_sym]
    end

    def meanings
      {}
    end
  end
end
