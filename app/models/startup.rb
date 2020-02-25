class Startup
  attr_reader :founder
  attr_accessor :name, :domain

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

  def pivot(domain, name)
    self.domain = domain
    self.name = name
  end

  def self.find_by_founder(founder)
    @@all.find{|startup| startup.founder == founder}
  end

  def self.domains
    @@all.map{|startup| startup.domain}.uniq
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def num_funding_rounds
    FundingRound.all.select{|rounds| rounds.startup == self}.length
  end

  def total_funds
    num_funding_rounds.reduce(0){|sum, rounds| sum + rounds.investment}
  end

  def investors
    FundingRound.all.select{|rounds| rounds.startup == self}
    .map{|rounds| rounds.venture_capitalist}.uniq
  end

  def big_investors
    (VentureCapitalist.tres_commas_club & self.investors).uniq
  end
end
