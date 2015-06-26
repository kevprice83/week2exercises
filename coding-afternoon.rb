require 'sinatra'
require 'sinatra/reloader'

set :port, 3003

get '/' do
  erb :calculator
end

post '/result' do
	@action = params["action"]
  	@n1 = params["n1"].to_f
  	@n2 = params["n2"].to_f

case @action 
	when "add"
		@result = @n1 + @n2

	when "subtract"
		@result = @n1- @n2

	when "multiply"
		@result = @n1 * @n2

	when "divide"
		@result = @n1/ @n2
	end

	erb :result
end

get '/count' do
	@upto = 200

	erb :counter
end



get '/hello/:name' do
  visits += 1
  @name = params[:name]
  erb :name
end
