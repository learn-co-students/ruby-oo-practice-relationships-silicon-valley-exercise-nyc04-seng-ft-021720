require_relative 'venture_capitalist'
require_relative 'funding_round'

class Startup

    attr_accessor :founder
    attr_reader :name, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all.push(self)
    end

    def pivot(domain, name)
        self.domain = domain
        self.name = name
    end

    def self.find_by_founder(founder_search)
        self.all.find{|startups|startups.founder == founder_search}
    end

    def self.domains
        self.all.map{|startups|startups.name}
    end

    def sign_contract(venture, type, amount)
        FundingRound.new(self, venture, type, amount.to_f)
    end

    def num_funding_rounds
        investors.length
    end

    def invested
        FundingRound.all.select{|funding|funding.startup == self}
    end

    def investors
        invested = FundingRound.all.select{|funding|funding.startup == self}
        invested.map{|investors|investors.venture_capitalist.name}
    end

    def total_funds
        invested.sum(&:investment)
    end

    def big_investors
        big = invested.select{|investors|investors.venture_capitalist.total_worth > 1000000000}
        big.map{|investors|investors.venture_capitalist.name}
    end

    def to_s
        "#{@founder} is the founder of #{@name}, a #{@domain} company."
    end

    def self.all
        @@all
    end

end