module ISO8583
  class Data < String
    attr_reader :elements

    def initialize(string, elements)
      @elements = elements
      super(string)
    end

    def fields
      index = 0
      elements.map do |element|
        definition = Definition::FIELDS[element.to_s.to_sym]
        string = definition[:type].call(self, definition[:length], index)
        element = Field.new(string, definition)
        index += string.size
        element
      end
    end
  end
end
