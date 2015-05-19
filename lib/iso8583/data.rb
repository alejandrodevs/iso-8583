module ISO8583
  class Data < String
    attr_reader :fields

    def initialize(string, fields)
      @fields = fields
      super(string)
    end

    def elements
      index = 0
      fields.map do |field|
        definition = Definition::FIELDS[field.to_s.to_sym]
        type    = definition[:type]
        length  = definition[:length]
        length  = self[index, type.size].to_i + type.size unless type == :fixed
        element = Element.new(self[index, length], definition)
        index   += length
        element
      end
    end
  end
end
