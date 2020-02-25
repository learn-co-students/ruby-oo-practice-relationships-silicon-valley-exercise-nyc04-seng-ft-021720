class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    # returns a **string** that is the startup's name
    def name
        @name
    end

    # returns a **string** that is the founder's name
    def founder
        @founder
    end

    # returns a **string** that is the startup's domain
    def domain
        @domain
    end

    # given a string of a **domain** and a string of a **name**, change the domain
    # and name of the startup. This is the only public method through which the
    # domain should be changed.
    def pivot(new_domain, new_name)
        @name = new_name
        @domain = new_domain
    end

    # given a string of a **founder's name**, returns the **first startup** whose founder's name matches
    def self.find_by_founder(founder_name)
        Startup.all.find {|startup| startup.founder == founder_name}
    end

    # should return an **array** of all of the different startup domains
    def self.domains
        Startup.all.map {|startup| startup.domain}.uniq
    end

    # given a **venture capitalist object**, type of investment (as a string), and the amount invested 
    # (as a float), creates a new funding round and associates it with that startup and venture capitalist.
    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    # Returns the total number of funding rounds that the startup has gotten
    def num_funding_rounds
        FundingRound.all.select {|fundinground| fundinground.startup == self}.count
    end

    # Returns the total sum of investments that the startup has gotten
    def total_funds
        startup_instances = FundingRound.all.select {|fundinground| fundinground.startup == self}
        startup_investments = startup_instances.map {|fundinground| fundinground.investment}
        startup_investments.reduce(:+)
    end

    # Returns a **unique** array of all the venture capitalists that have invested in this company
    def investors
        startup_instances = FundingRound.all.select {|fundinground| fundinground.startup == self}
        startup_investors = startup_instances.map {|fundinground| fundinground.venture_capitalist}
        startup_investors.uniq
    end

    # Returns a **unique** array of all the venture capitalists that have invested in this company 
    # and are in the Trés Commas club
    def big_investors
        tres_commas = VentureCapitalist.tres_commas_club
        self.investors.select {|vc| vc && tres_commas.include?(vc)}
    end

end
