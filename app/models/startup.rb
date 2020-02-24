class Startup

    attr_reader :founder
    attr_accessor :name, :domain
    @@all = []
    
    def initialize(name, founder, domain)
        @name = name 
        @founder = founder 
        @domain = domain 
        @@all.push(self)
    end 
    
    
    
    
    def sign_contract(venture_capitalist, type, amount_invested)
        FundingRound.new(self, venture_capitalist, type, amount_invested)
    end 
    
    def find_startup
        FundingRound.all.select do |rounds|
            rounds.startup == self 
        end 
    end
    
    def num_funding_rounds #return the amount of funding rounds a certain startup has gone through 
        find_startup.count
    end 
    
    def total_funds #returns the total amount of funds a startup has received, (all the rounds)
       x = find_startup.map do |rounds|
            rounds.amount_invested
        end
        x.sum
    end 
    
    def investors #returns a unique array of all the venture capitalists that have invested in this particluar startup
        investors = find_startup.map do |rounds|
            rounds.venture_capitalist.name
        end 
        investors.uniq
    end 
    
    def find_company
        FundingRound.all.select do |round|
            round.startup == self  
        end 
    
    end 
    
    
    def big_investors #Returns a unique array of all Tres Commas Club investors that have invested in this company
        tres_commas_club = VentureCapitalist.tres_commas_club
    
        investors = find_company.map do |company| #This gets a list of all the investors in this one company
            company.venture_capitalist
        end 
        
        investors & tres_commas_club #This compares to see if any of the investors are in the tres commas club.
    
    end 
    
    
    def for_this_startup
         investors = {}
         company = find_company 
         company.select do |rounds|
            if !investors[rounds.venture_capitalist]
                investors[rounds.venture_capitalist] = rounds.amount_invested
            else 
                investors[rounds.venture_capitalist] += rounds.amount_invested 
            end 
         end 
    
        investors = investors.select do |investors, total|
            investors if total >= 100_000_000_000
        end  
        investors.map do |investors|
            investors[0] 
        end
    end 
    
    
    
    def pivot(domain, name)#This will change the name and the domain of a certain startup 
        self.domain = domain
        self.name = name 
    end 
    
    def self.all
        @@all 
    end 
    
    def self.find_by_founder(founder) #Using founders name, return the first startup where it matches
        self.all.find do |startup|
            startup.founder == founder
        end 
    end 
    
    def self.domains #Returns an array of all the different startup domains
        self.all.map do |startup|
            startup.domain
        end 
    end 
    
    
    
    
    
    end 