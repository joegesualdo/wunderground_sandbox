require 'open-uri'
require 'json'

# Create a file for your wunderground api and name it .wunderground_api_key
WUNDERGROUND_API_KEY = File.open(".wunderground_api_key").read

# Prompts user to enter zip code
print "Enter your zipcode: "

# Assigns zip_code to the input the user enters and strips any new lines or spaces before and after
zip_code = gets.sub(/\n/,'').strip

# The wunderground url to fetch condition for our zip code
url = "http://api.wunderground.com/api/#{WUNDERGROUND_API_KEY}/conditions/q/#{zip_code}.json"

# Begin exception handling for unsuccessful api fetch
begin
  
# Fetch the url
raw = Kernel.open(url).read

# Rescue if api fetch is unsuccessful
rescue
puts "Could not fetch data for zip code #{zip_code}"

# Script if api fech is succesful
else
# Parse the json data received
parsed_json = JSON.parse(raw)

# Prints the response
puts parsed_json['response']

# Prints the current weather description
puts parsed_json['current_observation']['weather']

# End exception handling for unsuccessful api fetch
end
