require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# STARTUPS

etsy = Startup.new("Etsy", "Haim Shoppik", "ecomm")
glossier = Startup.new("Glossier", "Emily Weiss", "ecomm")
betterment = Startup.new("Betterment", "Jon Stein", "fintech")

# VENTURE CAPITALISTS
# Angel, Pre-Seed, Seed, Series A, Series B, Series C

gen_cat = VentureCapitalist.new("General Catalyst", 900_000_000)
sequoia = VentureCapitalist.new("Sequoia", 5_000_000_000)
monopoly = VentureCapitalist.new("Monopoloy Investments", 2_000_000_000)

# FUNDING ROUNDS

gen_cat.offer_contract(etsy, "Series A", 1_000_000.00)
sequoia.offer_contract(etsy, "Series B", 2_000_000.00)
monopoly.offer_contract(etsy, "Series B", 3_500_000.00)
gen_cat.offer_contract(glossier, "Series B", 3_000_000.00)
gen_cat.offer_contract(betterment, "Series C", 10_000_000.00)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line