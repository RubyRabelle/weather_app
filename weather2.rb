#weather_app.rb  Rabelle Rouser 10/5/2015


def get_weather
	require 'yahoo_weatherman'  #gem

	#get weather by zipcode
	puts "\n  To find out the local weather, enter a zipcode:"
 	my_location = gets.chomp

	client = Weatherman::Client.new(options = {:unit => 'f'}) #convert default unit to F
	weather = client.lookup_by_location(my_location)
	

	#create a string to describe location returned from zipcode
	location = weather.location
	str_location = "\n   ...getting Weather for #{location['city']}, #{location['region']}  #{my_location}"
	puts str_location
	
	#Assign some variables
	today = Time.now.day
	tomorrow = today + 1
	list = weather.forecasts
	
	list.each do |item|  #Loop thru each day of weather forecast
		puts "\n"
		if item['date'].day == today
			str_day = "  Today's"
		elsif item['date'].day == today +1
			str_day = "  Tomorrow's"
		else
			str_day = "  #{item['date'].strftime("%A")}'s"
		end

	#display message
	str_forecast = "#{str_day} forecast: #{item['text']}, with a high of #{item['high']}F and a low of #{item['low']}F."
	puts str_forecast
	end
end

# Run my method
get_weather
