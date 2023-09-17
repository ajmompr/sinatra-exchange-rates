require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
   # Fetch Exchange rate symbols API URL
   exch_symbols_url = "https://api.exchangerate.host/symbols"

   # Place GET request to the exchange rate API url
   raw_exch_symbols = HTTP.get(exch_symbols_url)

   # Parse the HTTP Response with JSON 
   parsed_response_symbols = JSON.parse(raw_exch_symbols)

   # Create symbol hash to obtain currency names
   @symbol_hash = parsed_response_symbols.fetch("symbols")
   

  erb(:home)
end
