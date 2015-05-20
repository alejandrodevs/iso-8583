module ISO8583
  class BaseField
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def to_s
      @data
    end
  end
end
