module ISO8583
  class Field
    attr_reader :data, :value, :definition

    def initialize(data, definition)
      @data = data
      @definition = definition
      @value = extract_value
    end

    def to_s
      @data
    end

    private

    def extract_value
      return data[1, data.size] if definition[:type] == :LVAR
      return data[2, data.size] if definition[:type] == :LLVAR
      return data[3, data.size] if definition[:type] == :LLLVAR
      data
    end
  end
end
