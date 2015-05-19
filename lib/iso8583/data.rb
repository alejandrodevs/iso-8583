module ISO8583
  class Data < String
    attr_reader :fields

    def initialize(string, fields)
      @fields = fields
      super(string)
    end
  end
end
