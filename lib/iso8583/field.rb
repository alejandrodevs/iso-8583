module ISO8583
  class Field
    attr_reader :field, :data, :value, :options

    def initialize(field, data, options)
      @field = field
      @data = data
      @options = options
      @value = extract_value
    end

    def to_s
      @data
    end

    private

    def extract_value
      return data[1, data.size] if options[:type] == :LVAR
      return data[2, data.size] if options[:type] == :LLVAR
      return data[3, data.size] if options[:type] == :LLLVAR
      data
    end
  end
end
