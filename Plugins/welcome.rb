class Welcome
  include Cinch::Plugin
	  
	listen_to :join, method: :response; 

	
	def response(m)
		if m.user == "Contingency"
			m.channel.send "Hello, Master!"
		elsif m.user == "C0deMaver1ck"
			m.channel.send "Whats up, C0deMaver1ck!"
		elsif m.user == "C0deMaver1ck"
			m.channel.send "Whats up, C0deMaver1ck!"
		elsif m.user == "t-y-l-e-r"
			m.channel.send "Hiya, t-y-l-e-r"
		elsif m.user == "howtomen"
			m.channel.send "Howtomen, if you fuck up, I have the power to kick you! :D"
		elsif m.user == "drowningchild"
			m.channel.send "Where ya been, drowningchild?"
		elsif m.user == "drift"
			m.channel.send "Drift, needs help..."
		else
			m.channel.send "Welcome to Panicroom!"
		end
	end
end
	