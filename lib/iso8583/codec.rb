module ISO8583
  class Codec < Regexp
    attr_reader :name

    def initialize(regexp, name)
      @name = name
      super(regexp)
    end

    def to_s
      @name
    end
  end
end
