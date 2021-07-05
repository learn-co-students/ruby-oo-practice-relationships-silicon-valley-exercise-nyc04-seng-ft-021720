require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry

piper = Startup.new("Pied Piper", "Richard Hendricks", "Tech")
new_pied_piper = Startup.new("New Pied Piper", "Jin Yang", "Tech")
russ_h = VentureCapitalist.new("Russ Hanneman", 999999999)
raviga = VentureCapitalist.new("Raviga", 1500000000)


piper.sign_contract(russ_h, "Series A", 1000000)
piper.sign_contract(raviga, "Series B", 1500000)
raviga.offer_contract(new_pied_piper, "Series A", 500000)
p raviga.invested("Tech")
p piper.investors


puts piper
puts raviga
puts russ_h

# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


0 #leave this here to ensure binding.pry isn't the last line