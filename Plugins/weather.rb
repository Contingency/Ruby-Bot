class Weather
	include Cinch::Plugin

	match /weather (.+)/

	def weather(zipcode)
	url = "http://www.google.com/ig/api?weather=#{CGI.escape(zipcode)}"
	weather_data = Nokogiri::XML(open(url))

	city = weather_data.xpath('/xml_api_reply/weather/forecast_information/city/@data').to_s
	condition = weather_data.xpath('/xml_api_reply/weather/current_conditions/condition/@data').to_s
	temp_f = weather_data.xpath('/xml_api_reply/weather/current_conditions/temp_f/@data').to_s
	temp_c = weather_data.xpath('/xml_api_reply/weather/current_conditions/temp_c/@data').to_s
	humidity = weather_data.xpath('/xml_api_reply/weather/current_conditions/humidity/@data').to_s
	
	return "Current Weather in #{city} is:  #{condition}			#{temp_f}F\/#{temp_c}C			#{humidity}"
    end


	def execute(m, zipcode)
		m.reply(weather(zipcode))
	end
end