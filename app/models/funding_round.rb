class FundingRound
    attr_reader :startup, :venture_capitalist, :type, :investment, :domain

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type # type of funding round
        @investment = investment
        @@all << self
    end

    # returns the startup object for that given funding round
    def startup
        @startup
    end

    # returns the venture capitalist object for that given funding round
    def venture_capitalist
        @venture_capitalist
    end

    # returns a **string** that is the type of funding round
    def type
        @type
    end

    # returns all of the funding rounds
    def self.all
        @@all
    end

end
