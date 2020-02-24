class FundingRound

    attr_reader :startup, :venture_capitalist, :round_number, :type, :amount_invested

    @@all = []

    def initialize(startup, venture_capitalist, type, amount_invested)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type 
        @amount_invested = amount_invested
        @@all.push(self)

    end 


    def investment #Returns number that is the total amount in this certain round, float
        self.amount_invested
    end 
    
    def self.all 
        @@all 
    end 

end 