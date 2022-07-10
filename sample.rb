require 'sinatra'
require 'sinatra/reloader'

set :bind, '0.0.0.0'
set :auth do |*roles|   # <- notice the splat here
  condition do
    unless roles.include?(:admin)
      redirect "/login/", 303
    end
  end
end


get '/' do
  test = "simple ccc"
  "Hello #{test}"
end

get '/hello/:name' do
  name = params[:name]
  "Hello #{name}"
end

get "/only/admin", :auth => :admin do
  "You are admin"
end

get "/test/index" do
  logger.info "loading data"
  erb :index
end

not_found do
  'This is nowhere to be found.'
end