require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
apple = Startup.new('apple', 'steve', 'apple.com')
google = Startup.new('google', 'sergey', 'google.com')
facebook = Startup.new('facebook', 'mark', 'facebook.com')

cuban = VentureCapitalist.new('mark cuban', 1000000001)
gates = VentureCapitalist.new('bill gates', 999999999999)
kevin = VentureCapitalist.new('kevin clark', 1000)

apple_angel = FundingRound.new(apple, cuban, 'Angel', 100000)
google_series_a = FundingRound.new(google, gates, 'Series A', 500000)
facebook_series_c = FundingRound.new(facebook, kevin, 'Series C', 25)
facebook_series_g = FundingRound.new(facebook, cuban, 'Series G', 1)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line