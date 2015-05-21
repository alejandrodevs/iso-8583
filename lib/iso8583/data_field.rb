module ISO8583
  class DataField < Field
    attr_reader :id, :value, :options

    def initialize(id, data, options)
      super(data)
      @id = id
      @options = options
      @value = extract_value
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
