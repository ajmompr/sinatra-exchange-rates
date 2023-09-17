require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/") do
  
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

get("/:currency_1") do
  # Fetch Exchange rate symbols API URL
  exch_symbols_url = "https://api.exchangerate.host/symbols"

  # Place GET request to the exchange rate API url
  raw_exch_symbols = HTTP.get(exch_symbols_url)

  # Parse the HTTP Response with JSON 
  parsed_response_symbols = JSON.parse(raw_exch_symbols)

  # Create symbol hash to obtain currency names
  @symbol_hash = parsed_response_symbols.fetch("symbols")

  # Parse currency_1 value
  @curr_1 = params.fetch("currency_1").upcase

  erb(:convert_1)
end

get("/:currency_1/:currency_2") do
  # Parse currency_1 value
  @curr_1 = params.fetch("currency_1").upcase
  @curr_2 = params.fetch("currency_2").upcase

  # Assemble exchange rate URL
  exch_rate_url = "https://api.exchangerate.host/convert?from=" + @curr_1 + "&to=" + @curr_2
  pp exch_rate_url

  # Place GET request to exchange rate API
  raw_exch_rate = HTTP.get(exch_rate_url)

  # Parse HTTP Response
  parsed_exch_rate = JSON.parse(raw_exch_rate)

  # Create info hash to obtain exchange rate
  @info_hash = parsed_exch_rate.fetch("info")

 
   
  erb(:convert_2)

end 
