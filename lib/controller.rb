require 'gossip'
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
   end
  get '/gossips/new/' do
    erb :new_gossip
  end

  get '/gossips/:id' do
    erb :show, locals: {gossips: Gossip.find(params['id'].to_i),id:params["id"]}
  end

  get '/gossips/:id/edit' do
    erb :edit, locals: {gossips: Gossip.find(params['id'].to_i),id:params["id"]}
  end

  post '/gossips/new/' do
    Gossip.new("#{params["gossip_author"]}","#{params["gossip_content"]}").save
    redirect '/'
  end

  post '/gossips/:id/edit' do
    Gossip.update("#{params["id"]}","#{params["gossip_edited"]}")
  end
end



