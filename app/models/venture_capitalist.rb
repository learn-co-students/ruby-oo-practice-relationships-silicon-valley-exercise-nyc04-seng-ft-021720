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

  def self.tres_commas_club
    @@all.select{|vc| vc.total_worth >= 1000000000}
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select{|rounds| rounds.venture_capitalist == self}
  end

  def portfolio
    funding_rounds.collect{|round| round.startup}.uniq
  end

  def biggest_investment
    funding_rounds.max_by{|round| round.investment}
  end

  def invested(domain_str)
    domains_by_investor = FundingRound.all.select{|round| round.startup.domain == domain_str && round.venture_capitalist == self}
    domains_by_investor.reduce(0){|sum, round| sum+round.investment }
  end
  
end 
