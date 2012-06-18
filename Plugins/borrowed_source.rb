class Autovoice
	include Cinch::Plugin
	listen_to :join
	
	def initialize(*args)
		super

		@users = ["C0deMaver1ck", "Contingency", "Red5", "drift","drowningchild", "drift", "shoman94"]
	  end
		
		def user(user)
		user.refresh
		@users.include?(user.nick)
		end

	   def listen(m)
		if user(m.user)
		  m.channel.voice(m.user)
		end
		end
	end

class Seen
  class SeenStruct < Struct.new(:who, :where, :what, :time)
    def to_s
      "[#{time.asctime}] #{who} was seen in #{where} saying #{what}"
    end
  end

  include Cinch::Plugin
  listen_to :channel
  match /seen (.+)/

  def initialize(*args)
    super
    @users = {}
  end

  def listen(m)
    @users[m.user.nick] = SeenStruct.new(m.user, m.channel, m.message, Time.now)
  end

  def execute(m, nick)
    if nick == @bot.nick
      m.reply "I'm obviously here, so why are you asking if I've seen myself? "
    elsif nick == m.user.nick
      m.reply "You blind? Stop asking me dumb questions..."
    elsif @users.key?(nick)
      m.reply @users[nick].to_s
    else
      m.reply "I haven't seen #{nick}, sorry."
    end
  end
end

class UrbanDictionary
  include Cinch::Plugin

  match /urban (.+)/
  def lookup(word)
    url = "http://www.urbandictionary.com/define.php?term=#{CGI.escape(word)}"
    CGI.unescape_html Nokogiri::HTML(open(url)).at("div.definition").text.gsub(/\s+/, ' ') rescue nil
  end

  def execute(m, word)
    m.reply(lookup(word) || "No results found", true)
  end
end

class Google
  include Cinch::Plugin
  match /google (.+)/

  def search(query)
    url = "http://www.google.com/search?q=#{CGI.escape(query)}"
    res = Nokogiri::HTML(open(url)).at("h3.r")

    title = res.text
    link = res.at('a')[:href]
    desc = res.at("./following::div").children.first.text
    CGI.unescape_html "#{title} - #{desc} (#{link})"
  rescue
    "No results found"
  end

  def execute(m, query)
    m.reply(search(query))
  end
end
