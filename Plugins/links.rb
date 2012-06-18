class Links
	include Cinch::Plugin
	
	match "xda", method: :xda
	match "google", method: :google
	match "imgur", method: :imgur
	match "facebook", method: :facebook
	match "twitter", method: :twitter
	match "rules", method: :rules
	match "laws", method: :laws
	match "bot", method: :bot
	match "commands", method: :commands
	
	def xda(m)
		m.reply "XDA:	http:\/\/www.xda-developers.com"
	end
	
	def google(m)
		m.reply "Google:	http:\/\/www.google.com"
	end
	
	def imgur(m)
		m.reply "Imgur:	http:\/\/www.imgur.com"
	end
	
	def facebook(m)
		m.reply "Facebook:	http:\/\/www.facebook.com"
	end
	
	def twitter(m)
		m.reply "Twitter:	http:\/\/www.twitter.com"
	end
	
	def rules(m)
		m.reply "Rules\n 1. Be nice"
	end
	
	def laws(m)
		m.reply "Three Laws of Robotics\n 1. A robot may not injure a human being or, through inaction, allow a human being to come to harm.\n 2. A robot must obey the orders given to it by human beings, except where such orders would conflict with the First Law.\n 3. A robot must protect its own existence as long as such protection does not conflict with the First or Second Laws.\n"
	end
	
	def bot(m)
		m.reply "Creator: Contingency\nBuilt: June 17, 2012\nVersion: 1.0\nDuties: Keep room clean and provide help when I can"
	end
	
	def commands(m)
		m.reply "Commands: !xda !google !facebook !twitter !imgur !google syntex !weather syntex !seen person !urban syntex !bot !rules !laws !admins !mods"
	end
	
end