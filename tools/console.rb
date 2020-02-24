require_relative '../app/models/startup'
require_relative '../app/models/funding_round'
require_relative '../app/models/venture_capitalist'




uber = Startup.new('Uber', 'Stanley', 'www.uber.com')
lyft = Startup.new('Lyft', 'Katy', 'www.lyft.com')
microsoft = Startup.new('Microsoft', 'Rox', 'www.microsoft.com')


jordan = VentureCapitalist.new("Jordan")
kenji = VentureCapitalist.new("Kenji")
kevin = VentureCapitalist.new("Kevin")




uber.sign_contract(kevin, 'Series B', 10_000_000_000.000)
microsoft.sign_contract(kevin, 'Series B', 100_000_000_000.000)
lyft.sign_contract(kevin, 'Series B', 100_000_000_000.000)

uber.sign_contract(kenji, 'Series Z', 100_000_000_000.000)
uber.sign_contract(kenji, 'Series Z', 100_000_000_000.000)

microsoft.sign_contract(jordan, 'Series Z', 100_000_000_000.000)






p VentureCapitalist.tres_commas_club #Shows all tres commas club members
p '------------------------------------'
p uber.big_investors #Shows all tres commas club members that have invested in this startup
p '------------------------------------'
p uber.for_this_startup #Show all members that ARE tres commas club FOR this startup