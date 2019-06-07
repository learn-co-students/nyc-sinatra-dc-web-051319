class ApplicationController < Sinatra::Base

  set :views, "./app/views/application"
  get '/' do
    erb :index
  end
end
