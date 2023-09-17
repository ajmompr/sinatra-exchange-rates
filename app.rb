require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
  erb(:home)
end
