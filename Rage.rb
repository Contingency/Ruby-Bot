$LOAD_PATH << File.join(Dir.getwd, 'Plugins')

	require 'cinch'
	require 'open-uri'
	require 'nokogiri'
	require 'cgi'
	require 'net/http'

	require 'admin'
	require 'links'
	require 'welcome'
	require 'weather'
	require 'borrowed_source'


	
	bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.channels = ["#panicroom"]
	c.nick = "Rage|Bot"
	c.verbose = true
	c.realname = "Rage"
	c.user = "Rage"
	c.reconnect = true
	c.plugins.plugins = [Administrators, Links, Weather, Seen, Google, UrbanDictionary, Autovoice, Welcome]
  end
  
end

bot.start
	