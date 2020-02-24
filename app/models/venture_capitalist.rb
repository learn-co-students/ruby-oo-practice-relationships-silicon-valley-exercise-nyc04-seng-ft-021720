class VentureCapitalist

    attr_reader :name
    
    
    @@all = []
    
    def initialize(name)
        @name = name 
        @@all.push(self)
    end 
    
    def total_worth #Think this might be the total amount they've invested through funding rounds/startups
      total =  funding_rounds.map do |rounds|
            rounds.amount_invested
        end 
        total.sum
    end 
    
    
    def self.all
        @@all 
    end 
    
    
    def offer_contract(startup,type, amount_invested)
        FundingRound.new(startup, self, type, amount_invested)
    end 
    
    
    
    
    def funding_rounds #returns an array of all funding rounds for a certain venture capitalist
        FundingRound.all do |rounds|
            rounds.venture_capitalist == self 
        end
    end 
    
    def portfolio #unique list of all startups this venture capitalist has funded
      x = funding_rounds.map do |rounds|
            rounds.startup
        end 
        unique_list = x.uniq {|u| u.name}
    end 
    
    def biggest_investment #returns the largest funding round by this certain capitalist
        funding_rounds.max_by(&:amount_invested)
    end 
    
    def invested(domain) #Total amount invested in that domain, given a domain string
       total =  funding_rounds.select do |rounds|
            rounds.startup.domain == domain
        end 
      total = total.map do |total|
            total.amount_invested
        end 
        total.sum
    end
    
    
    def self.investors_totals
        new_hash = {}
        h = FundingRound.all.select do |rounds|
            if !new_hash[rounds.venture_capitalist]
                new_hash[rounds.venture_capitalist] = rounds.amount_invested
            else 
                new_hash[rounds.venture_capitalist] += rounds.amount_invested 
            end 
        end
        new_hash
    end 
    
    def self.tres_commas_club #returns an array of all venture capitalists that have more then 1,000,000,000 total worth 
       tres_commas_club = self.investors_totals.select do |investors, total|
            investors if total >= 100_000_000_000
        end 
        
        tres_commas_club.map {|investor| investor[0]}
    end
    
    
    
    
    
    
    
    end 