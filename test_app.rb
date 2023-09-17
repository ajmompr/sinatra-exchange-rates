require "sinatra"
require "sinatra/reloader"
require "http"
require "json"
 
 
 # Fetch Exchange rate symbols API URL
 exch_symbols_url = "https://api.exchangerate.host/symbols"

 # Place GET request to the exchange symbol API url
 raw_exch_symbols = HTTP.get(exch_symbols_url)

 # Parse the HTTP Response with JSON 
 parsed_response_symbols = JSON.parse(raw_exch_symbols)

 # Create symbol hash to obtain currency names
 symbol_hash = parsed_response_symbols.fetch("symbols")

 symbol_hash.each do |key, value|
  pp key
 end

 get("/:currency_1/:currency_2") do
  # Parse currency_1 value
  @curr_1 = params.fetch("currency_1").upcase
  @curr_2 = params.fetch("currency_2").upcase
  
  # Assemble exchange rate URL
  exch_rate_url = "https://api.exchangerate.host/convert?from=" + @curr_1 + "&to=" + @curr_2

  # Place GET request to exchange rate API
  raw_exch_rate = HTTP.get(exch_rate_url)



 

 
   
  erb(:convert_2)

end 
