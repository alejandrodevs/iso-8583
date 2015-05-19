module ISO8583
  class Data::Element < String
    attr_reader :definition

    def initialize(string, definition)
      @definition = definition
      super(string)
    end
  end
end
