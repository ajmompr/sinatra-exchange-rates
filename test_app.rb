# require "sinatra"
# require "sinatra/reloader"
require "http"
require "json"
 
 
 # Fetch Exchange rate symbols API URL
 exch_symbols_url = "https://api.exchangerate.host/symbols"

 # Place GET request to the exchange rate API url
 raw_exch_symbols = HTTP.get(exch_symbols_url)

 # Parse the HTTP Response with JSON 
 parsed_response_symbols = JSON.parse(raw_exch_symbols)

 # Create symbol hash to obtain currency names
 symbol_hash = parsed_response_symbols.fetch("symbols")

 symbol_hash.each do |key, value|
  pp key
 end
