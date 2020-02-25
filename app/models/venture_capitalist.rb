class VentureCapitalist

    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    # returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 `total_worth`)
    def self.tres_commas_club
        @@all.select {|vc| vc.total_worth > 1_000_000_000}
    end

    # given a **startup object**, type of investment (as a string), and the amount invested (as a float), 
    # creates a new funding round and associates it with that startup and venture capitalist.
    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    # returns an array of all funding rounds for that venture capitalist
    def funding_rounds
        FundingRound.all.select {|fundinground| fundinground.venture_capitalist == self}
    end

    # Returns a **unique** list of all startups this venture capitalist has funded
    def portfolio
        self.funding_rounds.select {|fundinground| fundinground.startup}.uniq
    end

    # returns the largest funding round given by this venture capitalist
    def biggest_investment
        self.funding_rounds.max {|fundinground| fundinground.investment}
    end

    # given a **domain string**, returns the total amount invested in that domain
    def invested(domain)
        domain_type = self.funding_rounds.select {|fundinground| fundinground.startup.domain == domain}
        domain_type.map {|fundinground| fundinground.investment}.sum
    end

end
