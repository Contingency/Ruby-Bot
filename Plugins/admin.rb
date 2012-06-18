class Administrators
	include Cinch::Plugin
	
	match /join (.+)/, method: :join
	match /leave (.+)/, method: :leave
	match /kick (.+)/, method: :kick
	match /ban (.+)/, method: :ban
	match /op (.+)/, method: :op
	match /deop (.+)/, method: :deop
	match /voice (.+)/, method: :voice
	match /devoice (.+)/, method: :devoice
	match "admins", method: :admins
	match "mods", method: :mods
	
	def initialize(*args)
		super

    @administrators = ["Contingency", "t-y-l-e-r"]
	@moderators = ["C0deMaver1ck", "drift"]
	end
  
	def check_admin(user)
    user.refresh
    @administrators.include?(user.nick)
	end
	
	def check_mod(user)
	user.refresh
	@moderators.include?(user.nick)
	end
	
	def join(m, channel)
		if check_admin(m.user)
			Channel(channel).join
			m.reply "I have joinced: #{channel}"
		else
			m.reply "You don't get the privilge of telling me what to do!"
		end
	end
	
	def leave(m, channel)
		if check_admin(m.user)
			Channel(channel).part
		else
			m.reply "You don't get the privilge of telling me what to do!"
		end
	end
	
	def kick(m, nick)
		if check_admin(m.user) || check_mod(m.user)
			return unless nick != @bot.nick && nick != "Contingency"
				m.channel.kick(nick)
		else
			m.reply "You don't get the privilge of telling me what to do!"
		end
	end
	
	#def ban(m, nick)
	#	if check_admin(m.user) || check_mod(m.user)
	#		return unless nick != @bot.nick && nick != "Contingency"
	#			m.channel.kick(nick)
	#	else
	#		m.reply "You don't get the privilge of telling me what to do!"
	#	end
	#end
	
	def op(m, nick)
		if check_admin(m.user)
				m.channel.op(nick)
				m.reply "#{nick} has been set to Operator status."
		else
			m.reply "You don't get the privilge of telling me what to do!"
		end
	end

	def deop(m, nick)
		if check_admin(m.user)
				m.channel.deop(nick)
				m.reply "#{nick} has been removed of Operator status."
		else
			m.reply "You don't get the privilge of telling me what to do!"
		end
	end
	
	def voice(m, nick)
		if check_admin(m.user) || check_mod(m.user)
				m.channel.voice(nick)
				m.reply "#{nick} has been set to Voice status."
		else
			m.reply "You don't get the privilge of telling me what to do!"
		end
	end
	
	def devoice(m, nick)
		if check_admin(m.user) || check_mod(m.user)
				m.channel.devoice(nick)
				m.reply "#{nick} has been removed of Voice status."
		else
			m.reply "You don't get the privilge of telling me what to do!"
		end
	end
			
	def admins(m)
		m.reply @administrators
	end
	
	def mods(m)
		m.reply @moderators
	end
end