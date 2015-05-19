module ISO8583
  class Field < String
    attr_reader :definition

    def initialize(string, definition)
      @definition = definition
      super(string)
    end
  end
end
