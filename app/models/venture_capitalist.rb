require_relative 'startup'
require_relative 'funding_round'

class VentureCapitalist

    attr_accessor :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all.push(self)
    end

    def self.tres_commas_club
        tres_commas = self.all.select{|venture|venture.total_worth > 1000000000}
        tres_commas.map{|venture|venture.name}
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount.to_f)
    end

    def funded
        FundingRound.all.select{|funding| funding.venture_capitalist == self}
    end

    def funding_rounds
        funded.map{|funding|"#{funding.type} for #{funding.startup.name}"}
    end

    def portfolio
        funded.map{|funding|funding.startup.name}.uniq
    end

    def biggest_investment
        biggest = funded.max{|funding|funding.investment}
        biggest.startup.name
    end

    def invested(domain_search)
        funded_domain = funded.select{|funding|funding.startup.domain == domain_search}
        funded_domain.sum(&:investment)
    end

    def to_s
        
    end

    def self.all
        @@all
    end

end
