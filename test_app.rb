require "sinatra"
require "sinatra/reloader"
require "http"
require "json"
 
 
 # Fetch Exchange rate symbols API URL
 exch_symbols_url = "https://api.exchangerate.host/symbols"

 # Place GET request to the exchange rate API url
 raw_exch_symbols = HTTP.get(exch_symbols_url)
 #pp raw_exch_symbols

 parsed_response_symbols = JSON.parse(raw_exch_symbols)
 pp parsed_response_symbols
